import { describe, it, expect } from 'vitest'
import { renderHook, act } from '@testing-library/react'
import { useState } from 'react'

// Example custom hook (would normally be imported from @/hooks/useCounter)
function useCounter(initialValue = 0) {
  const [count, setCount] = useState(initialValue)

  const increment = () => setCount((c) => c + 1)
  const decrement = () => setCount((c) => c - 1)
  const reset = () => setCount(initialValue)
  const set = (value: number) => setCount(value)

  return { count, increment, decrement, reset, set }
}

describe('useCounter Hook', () => {
  it('initializes with default value of 0', () => {
    const { result } = renderHook(() => useCounter())
    expect(result.current.count).toBe(0)
  })

  it('initializes with provided initial value', () => {
    const { result } = renderHook(() => useCounter(10))
    expect(result.current.count).toBe(10)
  })

  it('increments count', () => {
    const { result } = renderHook(() => useCounter())

    act(() => {
      result.current.increment()
    })

    expect(result.current.count).toBe(1)
  })

  it('decrements count', () => {
    const { result } = renderHook(() => useCounter(5))

    act(() => {
      result.current.decrement()
    })

    expect(result.current.count).toBe(4)
  })

  it('resets to initial value', () => {
    const { result } = renderHook(() => useCounter(10))

    act(() => {
      result.current.increment()
      result.current.increment()
    })

    expect(result.current.count).toBe(12)

    act(() => {
      result.current.reset()
    })

    expect(result.current.count).toBe(10)
  })

  it('sets count to specific value', () => {
    const { result } = renderHook(() => useCounter())

    act(() => {
      result.current.set(42)
    })

    expect(result.current.count).toBe(42)
  })

  it('handles multiple operations', () => {
    const { result } = renderHook(() => useCounter(0))

    act(() => {
      result.current.increment()
      result.current.increment()
      result.current.increment()
      result.current.decrement()
    })

    expect(result.current.count).toBe(2)
  })
})
