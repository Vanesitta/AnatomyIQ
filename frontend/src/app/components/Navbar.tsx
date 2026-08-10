"use client";

import Link from 'next/link';
import { useAuth } from '../context/AuthContext';
import { usePathname } from 'next/navigation';

export default function Navbar() {
  const { user, logout, isLoading } = useAuth();
  const pathname = usePathname();

  if (isLoading) return null;

  return (
    <nav className="navbar">
      <Link href="/" className="nav-logo">
        AnatomyIQ
      </Link>
      <ul className="nav-links">
        <li>
          <Link href="/" className={`nav-link ${pathname === '/' ? 'active' : ''}`}>
            Systems
          </Link>
        </li>
        {user && (
          <>
            <li>
              <Link href="/health-log" className={`nav-link ${pathname === '/health-log' ? 'active' : ''}`}>
                Health Tracker
              </Link>
            </li>
            <li>
              <Link href="/analytics" className={`nav-link ${pathname === '/analytics' ? 'active' : ''}`}>
                Analytics
              </Link>
            </li>
          </>
        )}
        <li style={{ marginLeft: '12px' }}>
          {user ? (
            <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
              <div style={{
                display: 'flex',
                alignItems: 'center',
                gap: '10px',
                background: 'rgba(255, 255, 255, 0.03)',
                border: '1px solid var(--glass-border)',
                borderRadius: '24px',
                padding: '4px 14px 4px 6px',
                boxShadow: '0 4px 12px rgba(0, 0, 0, 0.1)'
              }}>
                <div style={{
                  width: '28px',
                  height: '28px',
                  borderRadius: '50%',
                  background: 'linear-gradient(to right, var(--primary), var(--secondary))',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  color: '#090d16',
                  fontWeight: '700',
                  fontSize: '14px',
                  textTransform: 'uppercase',
                  boxShadow: '0 0 8px var(--primary-glow)'
                }}>
                  {user.username.charAt(0)}
                </div>
                <span style={{ fontSize: '14px', color: 'var(--text-primary)', fontWeight: '500' }}>
                  {user.username}
                </span>
              </div>
              <button onClick={logout} className="btn btn-secondary" style={{ padding: '6px 16px', fontSize: '13px', borderRadius: '20px' }}>
                Logout
              </button>
            </div>
          ) : (
            <div style={{ display: 'flex', gap: '8px' }}>
              <Link href="/login" className="btn btn-secondary" style={{ padding: '6px 12px', fontSize: '13px' }}>
                Login
              </Link>
              <Link href="/register" className="btn btn-primary" style={{ padding: '6px 12px', fontSize: '13px' }}>
                Register
              </Link>
            </div>
          )}
        </li>
      </ul>
    </nav>
  );
}
