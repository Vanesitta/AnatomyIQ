import Link from 'next/link';
import ReactMarkdown from 'react-markdown';
import ZoomableImage from '../../components/ZoomableImage';
import { API_BASE_URL } from '@/config';

interface Organ {
  id: number;
  systemId: number;
  name: string;
  description: string;
  functions: string;
  imageUrl: string;
  studyNotes: string;
}

async function getOrganDetail(id: string): Promise<Organ | null> {
  try {
    const res = await fetch(`${API_BASE_URL}/api/organs/${id}`, { cache: 'no-store' });
    if (!res.ok) return null;
    return res.json();
  } catch (err) {
    console.error('getOrganDetail error:', err);
    return null;
  }
}

export default async function OrganDetailPage({ params }: { params: { id: string } }) {
  const organ = await getOrganDetail(params.id);

  if (!organ) {
    return (
      <main className="container animate-fade-in" style={{ textAlign: 'center', padding: '100px 20px' }}>
        <div className="glass-panel" style={{ maxWidth: '600px', margin: '0 auto' }}>
          <h2 style={{ color: 'var(--danger)', marginBottom: '16px' }}>Organ Not Found</h2>
          <p style={{ color: 'var(--text-secondary)', marginBottom: '24px' }}>
            The requested organ could not be loaded. Please ensure the backend is running.
          </p>
          <Link href="/" className="btn btn-secondary">
            &larr; Back to Home
          </Link>
        </div>
      </main>
    );
  }

  const functionList = organ.functions ? organ.functions.split(';') : [];

  return (
    <main className="container animate-fade-in">
      <div style={{ marginBottom: '32px' }}>
        <Link href={`/systems/${organ.systemId}`} style={{ color: 'var(--primary)', textDecoration: 'none', fontWeight: '600', fontSize: '14px' }}>
          &larr; Back to System
        </Link>
      </div>

      <div className="grid grid-cols-2" style={{ alignItems: 'center', gap: '40px' }}>
        <div>
          <span style={{ fontSize: '12px', textTransform: 'uppercase', letterSpacing: '0.1em', color: 'var(--primary)', fontWeight: '600' }}>
            Organ Physiology
          </span>
          <h1 style={{ fontSize: '3rem', marginTop: '8px', marginBottom: '20px', color: 'var(--text-primary)' }}>
            {organ.name}
          </h1>
          <p style={{ color: 'var(--text-secondary)', fontSize: '1.1rem', marginBottom: '30px', lineHeight: '1.7' }}>
            {organ.description}
          </p>

          <div className="glass-panel" style={{ marginBottom: '32px', background: 'rgba(255, 255, 255, 0.01)' }}>
            <h3 style={{ fontSize: '1.2rem', color: 'var(--secondary)', marginBottom: '16px', fontWeight: '600' }}>
              Primary Functions
            </h3>
            <ul style={{ listStyle: 'none' }}>
              {functionList.map((func, index) => (
                <li key={index} style={{ display: 'flex', gap: '10px', alignItems: 'flex-start', marginBottom: '12px', color: 'var(--text-secondary)', fontSize: '15px' }}>
                  <span style={{ color: 'var(--secondary)', fontSize: '18px', lineHeight: '1' }}>&bull;</span>
                  {func}
                </li>
              ))}
            </ul>
          </div>

          <div style={{ display: 'flex', gap: '16px' }}>
            <Link href={`/quiz/${organ.id}`} className="btn btn-primary" style={{ padding: '12px 30px' }}>
              Take Organ Quiz &rarr;
            </Link>
          </div>
        </div>

        <div style={{ display: 'flex', justifyContent: 'center' }}>
          <div className="glass-panel" style={{ width: '100%', maxWidth: '400px', height: '400px', display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', position: 'relative', border: '1px solid var(--glass-border)', padding: '20px', borderRadius: '24px', background: 'linear-gradient(135deg, rgba(22, 30, 47, 0.5) 0%, rgba(30, 41, 59, 0.3) 100%)', overflow: 'hidden' }}>
            
            <ZoomableImage src={organ.imageUrl} alt={organ.name} />

            <h3 style={{ fontSize: '1.2rem', marginBottom: '8px', color: 'var(--text-primary)' }}>{organ.name}</h3>
            <p style={{ color: 'var(--text-muted)', fontSize: '13px', textAlign: 'center' }}>
              Anatomical structure visual model.
            </p>
          </div>
        </div>
      </div>

      {organ.studyNotes && (
        <section style={{ marginTop: '48px' }} className="animate-fade-in">
          <div className="glass-panel" style={{ padding: '36px' }}>
            <span style={{ fontSize: '12px', textTransform: 'uppercase', letterSpacing: '0.1em', color: 'var(--secondary)', fontWeight: '600' }}>
              Study Guide
            </span>
            <h2 style={{ fontSize: '2rem', marginTop: '8px', marginBottom: '24px', color: 'var(--text-primary)' }}>
              Detailed Educational Notes
            </h2>
            <div style={{
              color: 'var(--text-secondary)',
              fontSize: '1.05rem',
              lineHeight: '1.8',
            }} className="markdown-content">
              <ReactMarkdown>{organ.studyNotes}</ReactMarkdown>
            </div>
          </div>
        </section>
      )}
    </main>
  );
}
