import { describe, it, expect } from 'vitest'
import { clsx, type ClassValue } from 'clsx'
import { twMerge } from 'tailwind-merge'

// Example utility function (would normally be imported from @/lib/utils)
export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

describe('cn Utility Function', () => {
  it('merges class names', () => {
    const result = cn('px-2 py-1', 'bg-blue-500')
    expect(result).toBe('px-2 py-1 bg-blue-500')
  })

  it('handles conditional classes with clsx', () => {
    const result = cn('base-class', {
      'active-class': true,
      'inactive-class': false,
    })
    expect(result).toBe('base-class active-class')
  })

  it('handles undefined and null values', () => {
    const result = cn('base-class', undefined, null, 'extra-class')
    expect(result).toBe('base-class extra-class')
  })

  it('merges conflicting Tailwind classes (keeps last)', () => {
    const result = cn('px-2', 'px-4')
    expect(result).toBe('px-4')
  })

  it('handles arrays of classes', () => {
    const result = cn(['px-2', 'py-1'], 'bg-blue-500')
    expect(result).toBe('px-2 py-1 bg-blue-500')
  })

  it('resolves complex Tailwind conflicts correctly', () => {
    const result = cn('text-sm font-bold', 'text-lg')
    expect(result).toBe('font-bold text-lg')
  })

  it('handles responsive and hover states', () => {
    const result = cn(
      'bg-blue-500 hover:bg-blue-600',
      'md:bg-green-500 md:hover:bg-green-600'
    )
    expect(result).toBe('bg-blue-500 hover:bg-blue-600 md:bg-green-500 md:hover:bg-green-600')
  })

  it('works with empty inputs', () => {
    const result = cn()
    expect(result).toBe('')
  })

  it('properly merges padding conflicts', () => {
    const result = cn('p-4', 'px-2')
    expect(result).toBe('p-4 px-2')
  })

  it('handles variant patterns common in components', () => {
    const variant = 'destructive'
    const size = 'lg'

    const variantStyles = {
      default: 'bg-blue-500',
      destructive: 'bg-red-500',
    }

    const sizeStyles = {
      sm: 'px-2 py-1',
      lg: 'px-4 py-2',
    }

    const result = cn(
      'base-button',
      variantStyles[variant as keyof typeof variantStyles],
      sizeStyles[size as keyof typeof sizeStyles]
    )

    expect(result).toBe('base-button bg-red-500 px-4 py-2')
  })
})
