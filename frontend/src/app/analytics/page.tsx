"use client";

import { useEffect, useState } from 'react';
import { useAuth } from '../context/AuthContext';
import Link from 'next/link';
import { API_BASE_URL } from '@/config';
import {
  ResponsiveContainer,
  LineChart,
  Line,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend
} from 'recharts';

interface HealthLog {
  id: number;
  userId: number;
  logDate: string;
  weightKg: number;
  heightCm: number;
  bmi: number;
  bloodPressure: string;
  heartRate: number | null;
  notes: string;
}

interface QuizSubmission {
  id: number;
  userId: number;
  organId: number;
  organName: string;
  systemName: string;
  scorePercentage: number;
  completedAt: string;
}

export default function AnalyticsPage() {
  const { user, token } = useAuth();
  const [logs, setLogs] = useState<HealthLog[]>([]);
  const [quizHistory, setQuizHistory] = useState<QuizSubmission[]>([]);
  const [loading, setLoading] = useState(true);
  const [activeTab, setActiveTab] = useState<'biometrics' | 'learning'>('biometrics');

  useEffect(() => {
    async function loadData() {
      if (!token) return;
      try {
        // Extract raw health logs
        const logsRes = await fetch(`${API_BASE_URL}/api/health-logs`, {
          headers: {
            'Authorization': `Bearer ${token}`,
          },
        });
        if (logsRes.ok) {
          const healthData = await logsRes.json();
          // Chronological order for graphs
          setLogs([...healthData].reverse());
        }

        // Extract raw quiz submissions from PostgreSQL
        const quizRes = await fetch(`${API_BASE_URL}/api/quiz/history`, {
          headers: {
            'Authorization': `Bearer ${token}`,
          },
        });
        if (quizRes.ok) {
          const quizData = await quizRes.json();
          // Chronological order for graphs
          setQuizHistory(quizData);
        }
      } catch (err) {
        console.error('Error fetching analytics:', err);
      } finally {
        setLoading(false);
      }
    }

    if (token) {
      loadData();
    } else {
      setLoading(false);
    }
  }, [token]);

  if (!user) {
    return (
      <main className="container animate-fade-in" style={{ textAlign: 'center', padding: '100px 20px' }}>
        <div className="glass-panel" style={{ maxWidth: '500px', margin: '0 auto' }}>
          <h2 style={{ marginBottom: '16px' }}>Authentication Required</h2>
          <p style={{ color: 'var(--text-secondary)', marginBottom: '24px' }}>
            Please log in or register to view your physiological analytics.
          </p>
          <Link href="/login" className="btn btn-primary">
            Go to Login
          </Link>
        </div>
      </main>
    );
  }

  if (loading) {
    return (
      <main className="container" style={{ textAlign: 'center', padding: '100px 20px' }}>
        <p style={{ color: 'var(--text-secondary)' }}>Loading analytics dashboards...</p>
      </main>
    );
  }

  // --- TRANSFORMATION PIPELINE ---

  // 1. Transform Biometric Trends
  const bmiData = logs.map(log => ({
    date: new Date(log.logDate).toLocaleDateString(undefined, { month: 'short', day: 'numeric' }),
    bmi: log.bmi
  }));

  const weightData = logs.map(log => ({
    date: new Date(log.logDate).toLocaleDateString(undefined, { month: 'short', day: 'numeric' }),
    weight: log.weightKg
  }));

  const heartRateData = logs
    .filter(log => log.heartRate !== null && log.heartRate !== undefined)
    .map(log => ({
      date: new Date(log.logDate).toLocaleDateString(undefined, { month: 'short', day: 'numeric' }),
      heartRate: log.heartRate
    }));

  // 2. Transform Quiz Submissions
  const quizTimelineData = quizHistory.map(q => ({
    date: new Date(q.completedAt).toLocaleDateString(undefined, { month: 'short', day: 'numeric' }),
    score: q.scorePercentage,
    organ: q.organName
  }));

  // Aggregation per organ
  const organScoresMap: { [key: string]: { sum: number; count: number } } = {};
  quizHistory.forEach(q => {
    const name = q.organName || `Organ ${q.organId}`;
    if (!organScoresMap[name]) {
      organScoresMap[name] = { sum: 0, count: 0 };
    }
    organScoresMap[name].sum += q.scorePercentage;
    organScoresMap[name].count += 1;
  });
  const organAvgData = Object.keys(organScoresMap).map(name => ({
    name,
    average: Math.round((organScoresMap[name].sum / organScoresMap[name].count) * 10) / 10
  }));

  // Aggregation per body system
  const systemScoresMap: { [key: string]: { sum: number; count: number } } = {};
  quizHistory.forEach(q => {
    const name = q.systemName || "General Anatomy";
    if (!systemScoresMap[name]) {
      systemScoresMap[name] = { sum: 0, count: 0 };
    }
    systemScoresMap[name].sum += q.scorePercentage;
    systemScoresMap[name].count += 1;
  });
  const systemAvgData = Object.keys(systemScoresMap).map(name => ({
    name: name.replace(" System", ""),
    average: Math.round((systemScoresMap[name].sum / systemScoresMap[name].count) * 10) / 10
  }));

  return (
    <main className="container animate-fade-in" style={{ paddingBottom: '60px' }}>
      <header style={{ marginBottom: '40px' }}>
        <h1 style={{ fontSize: '2.5rem', marginBottom: '8px', background: 'linear-gradient(135deg, #00f2fe 0%, #4facfe 100%)', WebkitBackgroundClip: 'text', WebkitTextFillColor: 'transparent' }}>
          Personal Analytics
        </h1>
        <p style={{ color: 'var(--text-secondary)' }}>
          Review your learning statistics, quiz performance, and track biometric trends over time.
        </p>
      </header>

      {/* Tab Navigation badges */}
      <div style={{
        display: 'flex',
        gap: '12px',
        marginBottom: '32px',
        borderBottom: '1px solid var(--glass-border)',
        paddingBottom: '12px'
      }}>
        <button
          onClick={() => setActiveTab('biometrics')}
          style={{
            background: activeTab === 'biometrics' ? 'linear-gradient(135deg, #00f2fe 0%, #4facfe 100%)' : 'rgba(255, 255, 255, 0.03)',
            border: activeTab === 'biometrics' ? 'none' : '1px solid var(--glass-border)',
            color: activeTab === 'biometrics' ? '#090d16' : 'var(--text-secondary)',
            fontWeight: '600',
            padding: '10px 24px',
            borderRadius: '30px',
            cursor: 'pointer',
            transition: 'all 0.3s ease',
            boxShadow: activeTab === 'biometrics' ? '0 4px 15px rgba(0, 242, 254, 0.3)' : 'none'
          }}
        >
          📈 Biometrics Tracking
        </button>
        <button
          onClick={() => setActiveTab('learning')}
          style={{
            background: activeTab === 'learning' ? 'linear-gradient(135deg, #00f2fe 0%, #4facfe 100%)' : 'rgba(255, 255, 255, 0.03)',
            border: activeTab === 'learning' ? 'none' : '1px solid var(--glass-border)',
            color: activeTab === 'learning' ? '#090d16' : 'var(--text-secondary)',
            fontWeight: '600',
            padding: '10px 24px',
            borderRadius: '30px',
            cursor: 'pointer',
            transition: 'all 0.3s ease',
            boxShadow: activeTab === 'learning' ? '0 4px 15px rgba(0, 242, 254, 0.3)' : 'none'
          }}
        >
          🧠 Learning Progress
        </button>
      </div>

      {/* BIOMETRICS DASHBOARD */}
      {activeTab === 'biometrics' && (
        <div style={{ display: 'flex', flexDirection: 'column', gap: '32px' }}>
          {logs.length < 2 ? (
            <div className="glass-panel" style={{ textAlign: 'center', padding: '60px 20px' }}>
              <p style={{ color: 'var(--text-secondary)', fontSize: '18px', marginBottom: '10px' }}>Not enough data points yet.</p>
              <p style={{ color: 'var(--text-muted)', fontSize: '14px', maxWidth: '400px', margin: '0 auto 24px' }}>
                Please log at least 2 entries in the <Link href="/health-log" style={{ color: '#00f2fe', textDecoration: 'underline' }}>Health Tracker</Link> to generate chronological biometric trends.
              </p>
              <Link href="/health-log" className="btn btn-primary">Go to Health Tracker</Link>
            </div>
          ) : (
            <div className="grid grid-cols-2" style={{ gap: '32px' }}>
              {/* BMI Line Chart */}
              <div className="glass-panel" style={{ minHeight: '380px' }}>
                <h2 style={{ fontSize: '1.1rem', marginBottom: '20px', color: 'var(--text-primary)', display: 'flex', alignItems: 'center', gap: '8px' }}>
                  <span style={{ color: '#00f2fe' }}>●</span> Body Mass Index (BMI) Trend
                </h2>
                <div style={{ width: '100%', height: '280px' }}>
                  <ResponsiveContainer width="100%" height="100%">
                    <LineChart data={bmiData} margin={{ top: 10, right: 20, left: -20, bottom: 0 }}>
                      <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" />
                      <XAxis dataKey="date" stroke="var(--text-muted)" fontSize={11} tickLine={false} />
                      <YAxis stroke="var(--text-muted)" fontSize={11} tickLine={false} domain={['auto', 'auto']} />
                      <Tooltip
                        contentStyle={{ backgroundColor: 'var(--card-bg)', border: '1px solid var(--glass-border)', borderRadius: '12px' }}
                        itemStyle={{ color: '#00f2fe' }}
                      />
                      <Line type="monotone" dataKey="bmi" name="BMI" stroke="#00f2fe" strokeWidth={3} dot={{ fill: '#00f2fe', strokeWidth: 2 }} activeDot={{ r: 8 }} />
                    </LineChart>
                  </ResponsiveContainer>
                </div>
              </div>

              {/* Weight Line Chart */}
              <div className="glass-panel" style={{ minHeight: '380px' }}>
                <h2 style={{ fontSize: '1.1rem', marginBottom: '20px', color: 'var(--text-primary)', display: 'flex', alignItems: 'center', gap: '8px' }}>
                  <span style={{ color: '#38ef7d' }}>●</span> Weight Progression (kg)
                </h2>
                <div style={{ width: '100%', height: '280px' }}>
                  <ResponsiveContainer width="100%" height="100%">
                    <LineChart data={weightData} margin={{ top: 10, right: 20, left: -20, bottom: 0 }}>
                      <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" />
                      <XAxis dataKey="date" stroke="var(--text-muted)" fontSize={11} tickLine={false} />
                      <YAxis stroke="var(--text-muted)" fontSize={11} tickLine={false} domain={['auto', 'auto']} />
                      <Tooltip
                        contentStyle={{ backgroundColor: 'var(--card-bg)', border: '1px solid var(--glass-border)', borderRadius: '12px' }}
                        itemStyle={{ color: '#38ef7d' }}
                      />
                      <Line type="monotone" dataKey="weight" name="Weight (kg)" stroke="#38ef7d" strokeWidth={3} dot={{ fill: '#38ef7d', strokeWidth: 2 }} activeDot={{ r: 8 }} />
                    </LineChart>
                  </ResponsiveContainer>
                </div>
              </div>

              {/* Heart Rate Line Chart */}
              <div className="glass-panel" style={{ minHeight: '380px', gridColumn: 'span 2' }}>
                <h2 style={{ fontSize: '1.1rem', marginBottom: '20px', color: 'var(--text-primary)', display: 'flex', alignItems: 'center', gap: '8px' }}>
                  <span style={{ color: '#ff4b5c' }}>●</span> Heart Rate History (bpm)
                </h2>
                {heartRateData.length === 0 ? (
                  <div style={{ height: '280px', display: 'flex', alignItems: 'center', justifyContent: 'center', color: 'var(--text-muted)' }}>
                    No heart rate entries logged yet.
                  </div>
                ) : (
                  <div style={{ width: '100%', height: '280px' }}>
                    <ResponsiveContainer width="100%" height="100%">
                      <LineChart data={heartRateData} margin={{ top: 10, right: 20, left: -20, bottom: 0 }}>
                        <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" />
                        <XAxis dataKey="date" stroke="var(--text-muted)" fontSize={11} tickLine={false} />
                        <YAxis stroke="var(--text-muted)" fontSize={11} tickLine={false} domain={['auto', 'auto']} />
                        <Tooltip
                          contentStyle={{ backgroundColor: 'var(--card-bg)', border: '1px solid var(--glass-border)', borderRadius: '12px' }}
                          itemStyle={{ color: '#ff4b5c' }}
                        />
                        <Line type="monotone" dataKey="heartRate" name="Heart Rate (bpm)" stroke="#ff4b5c" strokeWidth={3} dot={{ fill: '#ff4b5c', strokeWidth: 2 }} activeDot={{ r: 8 }} />
                      </LineChart>
                    </ResponsiveContainer>
                  </div>
                )}
              </div>
            </div>
          )}
        </div>
      )}

      {/* LEARNING PROGRESS DASHBOARD */}
      {activeTab === 'learning' && (
        <div style={{ display: 'flex', flexDirection: 'column', gap: '32px' }}>
          {quizHistory.length === 0 ? (
            <div className="glass-panel" style={{ textAlign: 'center', padding: '60px 20px' }}>
              <p style={{ color: 'var(--text-secondary)', fontSize: '18px', marginBottom: '10px' }}>No quiz records found.</p>
              <p style={{ color: 'var(--text-muted)', fontSize: '14px', maxWidth: '400px', margin: '0 auto 24px' }}>
                Complete interactive quizzes under organ study guides to populate learning performance and system breakdowns.
              </p>
              <Link href="/" className="btn btn-primary">Browse Systems</Link>
            </div>
          ) : (
            <div className="grid grid-cols-2" style={{ gap: '32px' }}>
              {/* Quiz Submission Score Timeline */}
              <div className="glass-panel" style={{ minHeight: '380px', gridColumn: 'span 2' }}>
                <h2 style={{ fontSize: '1.1rem', marginBottom: '20px', color: 'var(--text-primary)', display: 'flex', alignItems: 'center', gap: '8px' }}>
                  <span style={{ color: '#00f2fe' }}>●</span> Quiz Score Trends over Time
                </h2>
                <div style={{ width: '100%', height: '280px' }}>
                  <ResponsiveContainer width="100%" height="100%">
                    <LineChart data={quizTimelineData} margin={{ top: 10, right: 20, left: -20, bottom: 0 }}>
                      <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" />
                      <XAxis dataKey="date" stroke="var(--text-muted)" fontSize={11} tickLine={false} />
                      <YAxis stroke="var(--text-muted)" fontSize={11} tickLine={false} domain={[0, 100]} />
                      <Tooltip
                        contentStyle={{ backgroundColor: 'var(--card-bg)', border: '1px solid var(--glass-border)', borderRadius: '12px' }}
                        formatter={(value, name, props) => [`${value}%`, `Score (${props.payload.organ})`]}
                      />
                      <Line type="monotone" dataKey="score" name="Quiz Score" stroke="#00f2fe" strokeWidth={3} dot={{ fill: '#00f2fe', strokeWidth: 2 }} activeDot={{ r: 8 }} />
                    </LineChart>
                  </ResponsiveContainer>
                </div>
              </div>

              {/* Organ Performance Comparison */}
              <div className="glass-panel" style={{ minHeight: '380px' }}>
                <h2 style={{ fontSize: '1.1rem', marginBottom: '20px', color: 'var(--text-primary)', display: 'flex', alignItems: 'center', gap: '8px' }}>
                  <span style={{ color: '#38ef7d' }}>●</span> Average Score by Organ (%)
                </h2>
                <div style={{ width: '100%', height: '280px' }}>
                  <ResponsiveContainer width="100%" height="100%">
                    <BarChart data={organAvgData} margin={{ top: 10, right: 20, left: -20, bottom: 0 }}>
                      <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" />
                      <XAxis dataKey="name" stroke="var(--text-muted)" fontSize={11} tickLine={false} />
                      <YAxis stroke="var(--text-muted)" fontSize={11} tickLine={false} domain={[0, 100]} />
                      <Tooltip
                        contentStyle={{ backgroundColor: 'var(--card-bg)', border: '1px solid var(--glass-border)', borderRadius: '12px' }}
                        formatter={(value) => [`${value}%`, 'Average Score']}
                      />
                      <Bar dataKey="average" fill="#38ef7d" radius={[6, 6, 0, 0]} maxBarSize={40} />
                    </BarChart>
                  </ResponsiveContainer>
                </div>
              </div>

              {/* System Performance Comparison */}
              <div className="glass-panel" style={{ minHeight: '380px' }}>
                <h2 style={{ fontSize: '1.1rem', marginBottom: '20px', color: 'var(--text-primary)', display: 'flex', alignItems: 'center', gap: '8px' }}>
                  <span style={{ color: '#ff9f43' }}>●</span> Average Score by System (%)
                </h2>
                <div style={{ width: '100%', height: '280px' }}>
                  <ResponsiveContainer width="100%" height="100%">
                    <BarChart data={systemAvgData} margin={{ top: 10, right: 20, left: -20, bottom: 0 }}>
                      <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" />
                      <XAxis dataKey="name" stroke="var(--text-muted)" fontSize={11} tickLine={false} />
                      <YAxis stroke="var(--text-muted)" fontSize={11} tickLine={false} domain={[0, 100]} />
                      <Tooltip
                        contentStyle={{ backgroundColor: 'var(--card-bg)', border: '1px solid var(--glass-border)', borderRadius: '12px' }}
                        formatter={(value) => [`${value}%`, 'Average Score']}
                      />
                      <Bar dataKey="average" fill="#ff9f43" radius={[6, 6, 0, 0]} maxBarSize={40} />
                    </BarChart>
                  </ResponsiveContainer>
                </div>
              </div>
            </div>
          )}
        </div>
      )}
    </main>
  );
}
