"use client";

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { useAuth } from './context/AuthContext';
import { useRouter } from 'next/navigation';
import { API_BASE_URL } from '@/config';

interface BodySystem {
  id: number;
  name: string;
  description: string;
}

export default function HomePage() {
  const { user, isLoading } = useAuth();
  const router = useRouter();
  const [systems, setSystems] = useState<BodySystem[]>([]);
  const [systemsLoading, setSystemsLoading] = useState(true);

  useEffect(() => {
    if (!isLoading && !user) {
      router.push('/login');
    }
  }, [user, isLoading, router]);

  useEffect(() => {
    if (!user) return;

    async function loadSystems() {
      try {
        const res = await fetch(`${API_BASE_URL}/api/systems`);
        if (!res.ok) throw new Error('Failed to fetch systems');
        const data = await res.json();
        setSystems(data);
      } catch (err) {
        console.error('getSystems error:', err);
      } finally {
        setSystemsLoading(false);
      }
    }

    loadSystems();
  }, [user]);

  if (isLoading || !user) {
    return (
      <main className="container" style={{ textAlign: 'center', padding: '100px 20px' }}>
        <p style={{ color: 'var(--text-secondary)' }}>Checking authentication...</p>
      </main>
    );
  }

  if (systemsLoading) {
    return (
      <main className="container" style={{ textAlign: 'center', padding: '100px 20px' }}>
        <p style={{ color: 'var(--text-secondary)' }}>Loading body systems...</p>
      </main>
    );
  }

  return (
    <main className="container animate-fade-in">
      <header style={{ marginBottom: '40px', textAlign: 'center' }}>
        <h1 style={{ fontSize: '3rem', marginBottom: '16px', background: 'linear-gradient(to right, var(--primary), var(--secondary))', WebkitBackgroundClip: 'text', WebkitTextFillColor: 'transparent' }}>
          AnatomyIQ
        </h1>
        <p style={{ color: 'var(--text-secondary)', fontSize: '1.2rem', maxWidth: '600px', margin: '0 auto' }}>
          Explore the complexity of the human body through the power of <strong>Abstraction</strong>. We filter details down to the pedagogical essentials.
        </p>
      </header>

      {systems.length === 0 ? (
        <div className="glass-panel" style={{ textAlign: 'center', padding: '40px' }}>
          <h2 style={{ marginBottom: '12px', color: 'var(--danger)' }}>Connection Error</h2>
          <p style={{ color: 'var(--text-secondary)', marginBottom: '20px' }}>
            Could not connect to the AnatomyIQ Spring Boot API. Please ensure the backend server is running on port 8080.
          </p>
        </div>
      ) : (
        <div className="grid grid-cols-3" style={{ alignItems: 'stretch' }}>
          {systems.map((sys) => (
            <div key={sys.id} className="glass-panel" style={{ display: 'flex', flexDirection: 'column', justifyContent: 'space-between', height: '100%', minHeight: '250px', padding: '24px' }}>
              <div>
                <span style={{ fontSize: '11px', textTransform: 'uppercase', letterSpacing: '0.1em', color: 'var(--primary)', fontWeight: '600' }}>
                  Body System
                </span>
                <h2 style={{ fontSize: '1.5rem', marginTop: '6px', marginBottom: '12px', color: 'var(--text-primary)' }}>
                  {sys.name}
                </h2>
                <p style={{ color: 'var(--text-secondary)', marginBottom: '20px', fontSize: '14px', lineHeight: '1.5' }}>
                  {sys.description}
                </p>
              </div>
              <Link href={`/systems/${sys.id}`} className="btn btn-primary" style={{ width: 'fit-content' }}>
                Explore System &rarr;
              </Link>
            </div>
          ))}
        </div>
      )}
    </main>
  );
}
