import './globals.css';
import { AuthProvider } from './context/AuthContext';
import Navbar from './components/Navbar';

export const metadata = {
  title: 'AnatomyIQ - Computational Anatomy Education',
  description: 'A structured, interactive human anatomy learning platform using Abstraction.',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>
        <AuthProvider>
          <Navbar />
          {children}
        </AuthProvider>
      </body>
    </html>
  );
}
