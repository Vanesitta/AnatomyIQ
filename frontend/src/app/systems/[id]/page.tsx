import Link from 'next/link';
import { API_BASE_URL } from '@/config';

interface Organ {
  id: number;
  name: string;
  description: string;
}

interface BodySystem {
  id: number;
  name: string;
  description: string;
  organs: Organ[];
}

async function getSystemDetail(id: string): Promise<BodySystem | null> {
  try {
    const res = await fetch(`${API_BASE_URL}/api/systems/${id}`, { cache: 'no-store' });
    if (!res.ok) return null;
    return res.json();
  } catch (err) {
    console.error('getSystemDetail error:', err);
    return null;
  }
}

export default async function SystemDetailPage({ params }: { params: { id: string } }) {
  const system = await getSystemDetail(params.id);

  if (!system) {
    return (
      <main className="container animate-fade-in" style={{ textAlign: 'center', padding: '100px 20px' }}>
        <div className="glass-panel" style={{ maxWidth: '600px', margin: '0 auto' }}>
          <h2 style={{ color: 'var(--danger)', marginBottom: '16px' }}>System Not Found</h2>
          <p style={{ color: 'var(--text-secondary)', marginBottom: '24px' }}>
            The requested body system could not be loaded. Please ensure the backend is running.
          </p>
          <Link href="/" className="btn btn-secondary">
            &larr; Back to Systems
          </Link>
        </div>
      </main>
    );
  }

  return (
    <main className="container animate-fade-in">
      <div style={{ marginBottom: '32px' }}>
        <Link href="/" style={{ color: 'var(--primary)', textDecoration: 'none', fontWeight: '600', fontSize: '14px' }}>
          &larr; All Systems
        </Link>
      </div>

      <header className="glass-panel" style={{ marginBottom: '40px', borderLeft: '4px solid var(--primary)' }}>
        <span style={{ fontSize: '12px', textTransform: 'uppercase', letterSpacing: '0.1em', color: 'var(--primary)', fontWeight: '600' }}>
          System Overview
        </span>
        <h1 style={{ fontSize: '2.5rem', marginTop: '8px', marginBottom: '16px' }}>
          {system.name}
        </h1>
        <p style={{ color: 'var(--text-secondary)', fontSize: '1.1rem' }}>
          {system.description}
        </p>
      </header>

      <section>
        <h2 style={{ fontSize: '1.8rem', marginBottom: '24px', display: 'flex', alignItems: 'center', gap: '10px' }}>
          <span style={{ width: '8px', height: '24px', backgroundColor: 'var(--secondary)', borderRadius: '4px' }}></span>
          Organs in this System
        </h2>

        {system.organs && system.organs.length > 0 ? (
          <div className="grid grid-cols-3" style={{ alignItems: 'stretch' }}>
            {system.organs.map((organ) => (
              <div key={organ.id} className="glass-panel" style={{ display: 'flex', flexDirection: 'column', justifyContent: 'space-between', height: '100%', minHeight: '220px' }}>
                <div>
                  <h3 style={{ fontSize: '1.4rem', color: 'var(--text-primary)', marginBottom: '12px' }}>
                    {organ.name}
                  </h3>
                  <p style={{ color: 'var(--text-secondary)', fontSize: '14px', marginBottom: '20px' }}>
                    {organ.description.length > 120 ? organ.description.slice(0, 120) + '...' : organ.description}
                  </p>
                </div>
                <Link href={`/organs/${organ.id}`} className="btn btn-secondary" style={{ width: '100%', fontSize: '14px' }}>
                  Study Organ &rarr;
                </Link>
              </div>
            ))}
          </div>
        ) : (
          <div className="glass-panel" style={{ textAlign: 'center', padding: '40px' }}>
            <p style={{ color: 'var(--text-secondary)' }}>No organs registered for this system yet.</p>
          </div>
        )}
      </section>
    </main>
  );
}
