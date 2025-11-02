import { describe, it, expect, vi } from 'vitest'
import { render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'

// Example Button component (would normally be imported from @/components/ui/button)
interface ButtonProps {
  children: React.ReactNode
  onClick?: () => void
  variant?: 'default' | 'destructive' | 'outline'
  disabled?: boolean
}

const Button = ({ children, onClick, variant = 'default', disabled = false }: ButtonProps) => (
  <button
    onClick={onClick}
    disabled={disabled}
    className={`btn btn-${variant}`}
    data-variant={variant}
  >
    {children}
  </button>
)

describe('Button Component', () => {
  it('renders with children text', () => {
    render(<Button>Click me</Button>)
    expect(screen.getByText('Click me')).toBeInTheDocument()
  })

  it('calls onClick handler when clicked', async () => {
    const handleClick = vi.fn()
    const user = userEvent.setup()

    render(<Button onClick={handleClick}>Click me</Button>)

    await user.click(screen.getByText('Click me'))
    expect(handleClick).toHaveBeenCalledTimes(1)
  })

  it('renders with correct variant', () => {
    render(<Button variant="destructive">Delete</Button>)
    const button = screen.getByText('Delete')

    expect(button).toHaveAttribute('data-variant', 'destructive')
    expect(button).toHaveClass('btn-destructive')
  })

  it('does not call onClick when disabled', async () => {
    const handleClick = vi.fn()
    const user = userEvent.setup()

    render(<Button onClick={handleClick} disabled>Disabled</Button>)

    await user.click(screen.getByText('Disabled'))
    expect(handleClick).not.toHaveBeenCalled()
  })

  it('applies disabled attribute correctly', () => {
    render(<Button disabled>Disabled Button</Button>)
    expect(screen.getByText('Disabled Button')).toBeDisabled()
  })
})
