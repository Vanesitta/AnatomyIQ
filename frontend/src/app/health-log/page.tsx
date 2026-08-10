"use client";

import { useEffect, useState } from 'react';
import { useAuth } from '../context/AuthContext';
import Link from 'next/link';
import { API_BASE_URL } from '@/config';

interface HealthLog {
  id: number;
  userId: number;
  logDate: string;
  weightKg: number;
  heightCm: number;
  bmi: number;
  bloodPressure: string;
  heartRate: number;
  notes: string;
}

export default function HealthLogPage() {
  const { user, token, logout } = useAuth();
  const [logs, setLogs] = useState<HealthLog[]>([]);
  const [loading, setLoading] = useState(true);
  
  // Form state
  const [weight, setWeight] = useState('');
  const [height, setHeight] = useState('');
  const [bp, setBp] = useState('');
  const [hr, setHr] = useState('');
  const [notes, setNotes] = useState('');
  
  const [error, setError] = useState<string | null>(null);
  const [submitting, setSubmitting] = useState(false);

  async function fetchLogs() {
    if (!token) return;
    try {
      const res = await fetch(`${API_BASE_URL}/api/health-logs`, {
        headers: {
          'Authorization': `Bearer ${token}`,
        },
      });
      if (!res.ok) throw new Error('Failed to load logs.');
      const data = await res.json();
      setLogs(data);
    } catch (err: any) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    if (token) {
      fetchLogs();
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
            Please log in or register to log your biometrics and track your BMI over time.
          </p>
          <Link href="/login" className="btn btn-primary">
            Go to Login
          </Link>
        </div>
      </main>
    );
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    setSubmitting(true);

    const w = parseFloat(weight);
    const h = parseFloat(height);

    if (isNaN(w) || isNaN(h)) {
      setError('Weight and Height are required numeric values.');
      setSubmitting(false);
      return;
    }

    if (w <= 0 || h <= 0) {
      setError('Weight and Height must be greater than zero.');
      setSubmitting(false);
      return;
    }

    try {
      const res = await fetch(`${API_BASE_URL}/api/health-logs`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${token}`,
        },
        body: JSON.stringify({
          weightKg: w,
          heightCm: h,
          bloodPressure: bp || null,
          heartRate: hr ? parseInt(hr) : null,
          notes: notes || null,
        }),
      });

      if (!res.ok) {
        if (res.status === 401 || res.status === 404) {
          alert('Your session has expired or your user account was not found. Please log in again.');
          logout();
          return;
        }
        let msg = 'Failed to save health log.';
        try {
          const err = await res.json();
          msg = err.message || msg;
        } catch (e) {
          // ignore
        }
        throw new Error(msg);
      }

      // Reset form
      setWeight('');
      setHeight('');
      setBp('');
      setHr('');
      setNotes('');
      
      // Refresh list
      fetchLogs();
    } catch (err: any) {
      setError(err.message || 'Error saving logs.');
    } finally {
      setSubmitting(false);
    }
  };

  const handleDelete = async (logId: number) => {
    if (!confirm('Are you sure you want to delete this log entry?')) return;
    try {
      const res = await fetch(`${API_BASE_URL}/api/health-logs/${logId}`, {
        method: 'DELETE',
        headers: {
          'Authorization': `Bearer ${token}`,
        },
      });
      if (!res.ok) throw new Error('Failed to delete log.');
      fetchLogs();
    } catch (err: any) {
      alert(err.message || 'Error deleting log.');
    }
  };

  // Estimate BMI on the fly for good user feedback
  const weightNum = parseFloat(weight);
  const heightNum = parseFloat(height);
  const estimatedBmi = (!isNaN(weightNum) && !isNaN(heightNum) && heightNum > 0)
    ? (weightNum / ((heightNum / 100) * (heightNum / 100))).toFixed(2)
    : null;

  return (
    <main className="container animate-fade-in">
      <header style={{ marginBottom: '40px' }}>
        <h1 style={{ fontSize: '2.5rem', marginBottom: '8px' }}>Health Tracker</h1>
        <p style={{ color: 'var(--text-secondary)' }}>
          Log and monitor your body parameters. AnatomyIQ automatically tracks your Body Mass Index (BMI).
        </p>
      </header>

      <div className="grid grid-cols-2" style={{ gap: '32px', alignItems: 'start' }}>
        {/* Form Panel */}
        <div className="glass-panel">
          <h2 style={{ fontSize: '1.4rem', marginBottom: '24px', color: 'var(--text-primary)' }}>New Health Record</h2>
          <form onSubmit={handleSubmit}>
            <div className="form-group" style={{ display: 'flex', gap: '16px' }}>
              <div style={{ flex: 1 }}>
                <label className="form-label">Weight (kg) *</label>
                <input
                  type="number"
                  step="0.1"
                  className="form-input"
                  placeholder="e.g. 70"
                  value={weight}
                  onChange={(e) => setWeight(e.target.value)}
                  required
                />
              </div>
              <div style={{ flex: 1 }}>
                <label className="form-label">Height (cm) *</label>
                <input
                  type="number"
                  step="0.1"
                  className="form-input"
                  placeholder="e.g. 175"
                  value={height}
                  onChange={(e) => setHeight(e.target.value)}
                  required
                />
              </div>
            </div>

            {estimatedBmi && (
              <div className="glass-panel" style={{ padding: '12px 16px', marginBottom: '20px', background: 'rgba(6, 182, 212, 0.05)', border: '1px dashed var(--primary)' }}>
                <span style={{ fontSize: '13px', color: 'var(--text-secondary)' }}>Estimated BMI:</span>
                <strong style={{ marginLeft: '8px', color: 'var(--primary)', fontSize: '18px' }}>{estimatedBmi}</strong>
              </div>
            )}

            <div className="form-group" style={{ display: 'flex', gap: '16px' }}>
              <div style={{ flex: 1 }}>
                <label className="form-label">Blood Pressure (systolic/diastolic)</label>
                <input
                  type="text"
                  className="form-input"
                  placeholder="e.g. 120/80"
                  value={bp}
                  onChange={(e) => setBp(e.target.value)}
                />
              </div>
              <div style={{ flex: 1 }}>
                <label className="form-label">Heart Rate (bpm)</label>
                <input
                  type="number"
                  className="form-input"
                  placeholder="e.g. 72"
                  value={hr}
                  onChange={(e) => setHr(e.target.value)}
                />
              </div>
            </div>

            <div className="form-group">
              <label className="form-label">Notes & Observations</label>
              <textarea
                className="form-input"
                style={{ height: '80px', resize: 'vertical' }}
                placeholder="e.g. Feeling good, completed cardiovascular quiz."
                value={notes}
                onChange={(e) => setNotes(e.target.value)}
              />
            </div>

            {error && (
              <p style={{ color: 'var(--danger)', fontSize: '14px', marginBottom: '16px' }}>
                {error}
              </p>
            )}

            <button type="submit" disabled={submitting} className="btn btn-primary" style={{ width: '100%' }}>
              {submitting ? 'Saving record...' : 'Save Log Record'}
            </button>
          </form>
        </div>

        {/* History Panel */}
        <div className="glass-panel" style={{ minHeight: '380px' }}>
          <h2 style={{ fontSize: '1.4rem', marginBottom: '16px', color: 'var(--text-primary)' }}>History Logs</h2>
          {loading ? (
            <p style={{ color: 'var(--text-secondary)' }}>Loading health records...</p>
          ) : logs.length === 0 ? (
            <div style={{ padding: '60px 0', textAlign: 'center' }}>
              <p style={{ color: 'var(--text-secondary)', marginBottom: '8px' }}>No records logged yet.</p>
              <p style={{ color: 'var(--text-muted)', fontSize: '13px' }}>Your records will appear here as you log metrics.</p>
            </div>
          ) : (
            <div className="table-container">
              <table className="table">
                <thead>
                  <tr>
                    <th>Date</th>
                    <th>Weight</th>
                    <th>Height</th>
                    <th>BMI</th>
                    <th>BP / HR</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  {logs.map((log) => (
                    <tr key={log.id}>
                      <td style={{ fontSize: '14px', whiteSpace: 'nowrap' }}>{log.logDate}</td>
                      <td>{log.weightKg} kg</td>
                      <td>{log.heightCm} cm</td>
                      <td>
                        <strong style={{ color: 'var(--primary)' }}>{log.bmi}</strong>
                      </td>
                      <td style={{ fontSize: '13px', color: 'var(--text-secondary)' }}>
                        {log.bloodPressure || '--'} / {log.heartRate ? `${log.heartRate} bpm` : '--'}
                      </td>
                      <td>
                        <button
                          onClick={() => handleDelete(log.id)}
                          className="btn btn-danger"
                          style={{ padding: '4px 8px', fontSize: '12px', borderRadius: '4px' }}
                        >
                          Delete
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>
      </div>
    </main>
  );
}
