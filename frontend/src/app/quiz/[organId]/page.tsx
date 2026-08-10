"use client";

import { useEffect, useState } from 'react';
import { useAuth } from '../../context/AuthContext';
import Link from 'next/link';
import { API_BASE_URL } from '@/config';

interface Question {
  id: number;
  organId: number;
  questionText: string;
  optionA: string;
  optionB: string;
  optionC: string;
  optionD: string;
  correctOption: string;
  explanation: string;
}

interface ScoreData {
  organId: number;
  totalQuestions: number;
  correctAnswers: number;
  scorePercentage: number;
}

export default function QuizPage({ params }: { params: { organId: string } }) {
  const { user, token } = useAuth();
  const [questions, setQuestions] = useState<Question[]>([]);
  const [loading, setLoading] = useState(true);
  const [currentIdx, setCurrentIdx] = useState(0);
  const [selectedOpt, setSelectedOpt] = useState<string | null>(null);
  const [answers, setAnswers] = useState<Record<number, string>>({});
  const [scoreData, setScoreData] = useState<ScoreData | null>(null);
  const [loadError, setLoadError] = useState<string | null>(null);
  const [submitError, setSubmitError] = useState<string | null>(null);
  const [submitting, setSubmitting] = useState(false);

  useEffect(() => {
    async function loadQuestions() {
      try {
        const res = await fetch(`${API_BASE_URL}/api/quiz/organ/${params.organId}`);
        if (!res.ok) throw new Error('Failed to load questions.');
        const data = await res.json();
        setQuestions(data);
      } catch (err: any) {
        setLoadError(err.message || 'Error fetching quiz.');
      } finally {
        setLoading(false);
      }
    }
    loadQuestions();
  }, [params.organId]);

  if (!user) {
    return (
      <main className="container animate-fade-in" style={{ textAlign: 'center', padding: '100px 20px' }}>
        <div className="glass-panel" style={{ maxWidth: '500px', margin: '0 auto' }}>
          <h2 style={{ marginBottom: '16px' }}>Authentication Required</h2>
          <p style={{ color: 'var(--text-secondary)', marginBottom: '24px' }}>
            Please log in or register to take quizzes and track your progress.
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
        <p style={{ color: 'var(--text-secondary)' }}>Loading quiz questions...</p>
      </main>
    );
  }

  if (loadError || questions.length === 0) {
    return (
      <main className="container" style={{ textAlign: 'center', padding: '100px 20px' }}>
        <div className="glass-panel" style={{ maxWidth: '500px', margin: '0 auto' }}>
          <h2 style={{ color: 'var(--danger)', marginBottom: '16px' }}>Quiz Unavailable</h2>
          <p style={{ color: 'var(--text-secondary)', marginBottom: '24px' }}>
            {loadError || 'No questions available for this organ yet.'}
          </p>
          <Link href="/" className="btn btn-secondary">
            Back to Home
          </Link>
        </div>
      </main>
    );
  }

  const currentQuestion = questions[currentIdx];

  const handleSelectOption = (option: string) => {
    if (selectedOpt) return;
    setSelectedOpt(option);
    setAnswers({ ...answers, [currentQuestion.id]: option });
  };

  const handleNext = () => {
    if (currentIdx < questions.length - 1) {
      setCurrentIdx(currentIdx + 1);
      setSelectedOpt(answers[questions[currentIdx + 1].id] || null);
    }
  };

  const handlePrev = () => {
    if (currentIdx > 0) {
      setCurrentIdx(currentIdx - 1);
      setSelectedOpt(answers[questions[currentIdx - 1].id] || null);
    }
  };

  const handleSubmit = async () => {
    if (submitting) return;
    setSubmitting(true);
    setSubmitError(null);
    try {
      const activeToken = token || (typeof window !== 'undefined' ? localStorage.getItem('token') : null);
      if (!activeToken) {
        throw new Error('Authentication session expired. Please log in again.');
      }

      const submissionAnswers = Object.entries(answers).map(([qId, opt]) => ({
        questionId: Number(qId),
        selectedOption: opt,
      }));

      const res = await fetch(`${API_BASE_URL}/api/quiz/submit`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${activeToken}`,
        },
        body: JSON.stringify({
          organId: Number(params.organId),
          answers: submissionAnswers,
        }),
      });

      if (res.status === 401) {
        throw new Error('Your session has expired. Please log in again to save your quiz score.');
      }

      if (!res.ok) {
        let errorMsg = 'Failed to evaluate quiz.';
        try {
          const errData = await res.json();
          if (errData && errData.message) errorMsg = errData.message;
        } catch(e) {}
        throw new Error(errorMsg);
      }

      const result = await res.json();
      setScoreData(result);

    } catch (err: any) {
      setSubmitError(err.message || 'Error submitting quiz.');
    } finally {
      setSubmitting(false);
    }
  };

  if (scoreData) {
    return (
      <main className="container animate-fade-in" style={{ display: 'flex', justifyContent: 'center' }}>
        <div className="glass-panel" style={{ maxWidth: '550px', width: '100%', textAlign: 'center', padding: '40px' }}>
          <span style={{ fontSize: '12px', textTransform: 'uppercase', letterSpacing: '0.1em', color: 'var(--secondary)', fontWeight: '600' }}>
            Quiz Results
          </span>
          <h1 style={{ fontSize: '2.5rem', marginTop: '10px', marginBottom: '24px' }}>
            Well Done!
          </h1>
          
          <div style={{ display: 'flex', justifyContent: 'center', marginBottom: '32px' }}>
            <div style={{ width: '160px', height: '160px', borderRadius: '50%', border: '4px solid var(--secondary)', display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', boxShadow: '0 0 25px var(--secondary-glow)' }}>
              <span style={{ fontSize: '2.5rem', fontWeight: 'bold', color: 'var(--text-primary)' }}>
                {scoreData.scorePercentage}%
              </span>
              <span style={{ fontSize: '12px', color: 'var(--text-secondary)' }}>
                {scoreData.correctAnswers} / {scoreData.totalQuestions} Correct
              </span>
            </div>
          </div>

          <p style={{ color: 'var(--text-secondary)', marginBottom: '32px', fontSize: '15px' }}>
            You have successfully completed the anatomy evaluation for this organ. Keep studying to master other body systems!
          </p>

          <div style={{ display: 'flex', gap: '16px', justifyContent: 'center' }}>
            <Link href="/" className="btn btn-primary">
              All Systems
            </Link>
            <Link href="/analytics" className="btn btn-secondary">
              View Analytics
            </Link>
          </div>
        </div>
      </main>
    );
  }

  const isLastQuestion = currentIdx === questions.length - 1;
  const answeredCount = Object.keys(answers).length;
  const progressPercent = (answeredCount / questions.length) * 100;

  return (
    <main className="container animate-fade-in" style={{ maxWidth: '700px' }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '20px' }}>
        <span style={{ fontSize: '14px', color: 'var(--text-secondary)' }}>
          Question <strong>{currentIdx + 1}</strong> of <strong>{questions.length}</strong>
        </span>
        <span style={{ fontSize: '14px', color: 'var(--primary)', fontWeight: '600' }}>
          {answeredCount} answered
        </span>
      </div>

      <div style={{ width: '100%', height: '4px', backgroundColor: 'var(--glass-border)', borderRadius: '2px', marginBottom: '32px', overflow: 'hidden' }}>
        <div style={{ width: `${progressPercent}%`, height: '100%', backgroundColor: 'var(--primary)', transition: 'width 0.3s ease' }}></div>
      </div>

      <div className="glass-panel" style={{ marginBottom: '32px' }}>
        <h2 style={{ fontSize: '1.4rem', color: 'var(--text-primary)', marginBottom: '24px', fontWeight: '500' }}>
          {currentQuestion.questionText}
        </h2>

        {([
          { key: 'A', text: currentQuestion.optionA },
          { key: 'B', text: currentQuestion.optionB },
          { key: 'C', text: currentQuestion.optionC },
          { key: 'D', text: currentQuestion.optionD },
        ] as const).map(({ key, text }) => {
          const isCorrect = key === currentQuestion.correctOption;
          const isSelected = key === selectedOpt;
          let optClass = '';
          if (selectedOpt) {
            if (isCorrect) optClass = 'correct';
            else if (isSelected) optClass = 'incorrect';
          }
          return (
            <button
              key={key}
              onClick={() => handleSelectOption(key)}
              className={`quiz-option ${optClass}`}
              style={{ pointerEvents: selectedOpt ? 'none' : 'auto' }}
            >
              <span style={{ fontWeight: 'bold', marginRight: '16px', color: 'var(--primary)' }}>{key}</span> {text}
            </button>
          );
        })}

        {selectedOpt && (
          <div className="glass-panel animate-fade-in" style={{ marginTop: '24px', borderColor: selectedOpt === currentQuestion.correctOption ? 'var(--secondary)' : 'var(--danger)', background: 'rgba(9, 13, 22, 0.4)' }}>
            <h3 style={{ color: selectedOpt === currentQuestion.correctOption ? 'var(--secondary)' : 'var(--danger)', marginBottom: '8px', fontSize: '1.1rem', fontWeight: '600' }}>
              {selectedOpt === currentQuestion.correctOption ? '✓ Correct!' : '✗ Incorrect'}
            </h3>
            {currentQuestion.explanation && (
              <p style={{ color: 'var(--text-secondary)', fontSize: '14px', lineHeight: '1.5' }}>
                {currentQuestion.explanation}
              </p>
            )}
          </div>
        )}
      </div>

      {submitError && (
        <p style={{ color: 'var(--danger)', fontSize: '14px', marginBottom: '16px', textAlign: 'center' }}>
          {submitError}
        </p>
      )}

      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <button onClick={handlePrev} disabled={currentIdx === 0} className="btn btn-secondary" style={{ opacity: currentIdx === 0 ? 0.5 : 1, cursor: currentIdx === 0 ? 'not-allowed' : 'pointer' }}>
          &larr; Previous
        </button>
        
        {isLastQuestion ? (
          <button onClick={handleSubmit} disabled={answeredCount < questions.length || submitting} className="btn btn-primary">
            {submitting ? 'Evaluating...' : 'Submit Answers'}
          </button>
        ) : (
          <button onClick={handleNext} disabled={!selectedOpt} className="btn btn-secondary" style={{ opacity: !selectedOpt ? 0.5 : 1, cursor: !selectedOpt ? 'not-allowed' : 'pointer' }}>
            Next &rarr;
          </button>
        )}
      </div>
    </main>
  );
}
