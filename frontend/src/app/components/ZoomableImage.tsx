"use client";

import React, { useState, useEffect } from 'react';
import Image from 'next/image';
import { createPortal } from 'react-dom';

interface ZoomableImageProps {
  src: string;
  alt: string;
}

export default function ZoomableImage({ src, alt }: ZoomableImageProps) {
  const [isOpen, setIsOpen] = useState(false);
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
  }, []);

  const isHeart = src.toLowerCase().includes('heart') || alt.toLowerCase().includes('heart');
  const imageFilter = isHeart ? 'brightness(1.3) contrast(1.15)' : undefined;

  return (
    <>
      <div 
        onClick={() => setIsOpen(true)}
        style={{ 
          width: '220px', 
          height: '220px', 
          position: 'relative', 
          marginBottom: '24px', 
          borderRadius: '16px', 
          overflow: 'hidden', 
          border: '1px solid var(--glass-border)', 
          boxShadow: '0 8px 32px rgba(0,0,0,0.3)',
          cursor: 'zoom-in',
        }}
        className="zoomable-trigger"
      >
        <Image
          src={src}
          alt={alt}
          fill
          sizes="(max-width: 400px) 100vw, 400px"
          style={{ 
            objectFit: 'cover',
            filter: imageFilter,
          }}
        />
        <div style={{
          position: 'absolute',
          bottom: '10px',
          right: '10px',
          background: 'rgba(9, 13, 22, 0.6)',
          border: '1px solid var(--glass-border)',
          borderRadius: '50%',
          width: '32px',
          height: '32px',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          color: 'var(--text-primary)',
          fontSize: '14px',
          pointerEvents: 'none'
        }}>
          🔍
        </div>
      </div>

      {isOpen && mounted && createPortal(
        <div 
          onClick={() => setIsOpen(false)}
          style={{
            position: 'fixed',
            top: 0,
            left: 0,
            width: '100vw',
            height: '100vh',
            background: 'rgba(5, 7, 12, 0.9)',
            backdropFilter: 'blur(8px)',
            zIndex: 9999,
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            cursor: 'zoom-out',
          }}
        >
          <button
            onClick={(e) => {
              e.stopPropagation();
              setIsOpen(false);
            }}
            style={{
              position: 'absolute',
              top: '24px',
              right: '24px',
              background: 'rgba(255, 255, 255, 0.05)',
              border: '1px solid rgba(255, 255, 255, 0.1)',
              color: 'var(--text-primary)',
              width: '44px',
              height: '44px',
              borderRadius: '50%',
              fontSize: '20px',
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
            }}
          >
            ✕
          </button>
          
          <div 
            onClick={(e) => e.stopPropagation()}
            style={{
              position: 'relative',
              width: '90%',
              maxWidth: '800px',
              height: '80%',
              maxHeight: '600px',
              borderRadius: '24px',
              overflow: 'hidden',
              border: '1px solid var(--glass-border)',
              boxShadow: '0 24px 64px rgba(0,0,0,0.5)',
            }}
          >
            <Image
              src={src}
              alt={alt}
              fill
              sizes="(max-width: 1200px) 100vw, 1200px"
              style={{ 
                objectFit: 'contain',
                filter: imageFilter,
              }}
            />
          </div>
        </div>,
        document.body
      )}
    </>
  );
}
