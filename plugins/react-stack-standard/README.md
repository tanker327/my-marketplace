# React Stack Standard Plugin

A Claude Code plugin that provides a standardized React project setup with best practices, modern tooling, and Docker deployment.

## Features

- **Consistent Stack**: React 18, TypeScript, Vite, TailwindCSS, shadcn/ui
- **State Management**: Zedux (client) + React Query (server)
- **Forms**: React Hook Form + Zod validation
- **Testing**: Vitest + React Testing Library with demo test examples
- **Code Quality**: ESLint, Prettier, Husky
- **Docker**: Multi-stage build with nginx for production deployment

## Project Structure

```
src/
├── atoms/       # Zedux state atoms
├── components/  # Reusable UI components
├── views/       # Composed sections
├── pages/       # Full page layouts
├── hooks/       # Custom hooks
├── lib/         # Utilities
├── types/       # TypeScript types
└── tests/       # Test setup
```

## Architecture

**Layered approach:**
- atoms → components → views → pages

This structure provides:
- Clear separation of concerns
- Better reusability
- Easier testing
- Scalability

## Docker Multi-Stage Build

The plugin includes an optimized 3-stage Docker build:

1. **Stage 1 (deps)**: ✅ CACHED
   - Only rebuilds when package.json changes
   - Installs all dependencies
   
2. **Stage 2 (builder)**: 🔄 REBUILDS
   - Runs when source code changes
   - Uses cached dependencies
   - Builds production bundle

3. **Stage 3 (runtime)**: 🔄 REBUILDS
   - Lightweight nginx alpine image (~23MB)
   - Serves built static assets
   - Production-ready configuration

**Benefits:**
- Fast rebuilds (deps layer cached)
- Small final image (~50MB)
- Production nginx with security headers
- Health checks included
- Gzip compression enabled

## Usage

In Claude Code, use the React setup agent:

```
/agent react-setup

"Create a new React project called my-app with Docker"
```

The agent will:
1. Set up the Vite project
2. Install all dependencies
3. Create the folder structure
4. Configure build tools
5. Set up testing with demo test examples
6. Configure code quality tools
7. Create Docker files (Dockerfile, nginx.conf, .dockerignore, docker-compose.yml)

## Testing

The plugin includes comprehensive test setup with demo examples:

**Demo Test Files:**
- `Button.test.tsx` - Component testing with React Testing Library
- `useCounter.test.ts` - Hook testing with renderHook
- `cn.test.ts` - Utility function testing

**Test Commands:**
```bash
# Run tests in watch mode (development)
npm test

# Run tests once (CI/CD)
npm run test:run

# Run tests with UI dashboard
npm run test:ui

# Run tests with coverage report
npm run test:coverage
```

## Docker Commands

```bash
# Build the image
docker build -t my-app:latest .

# Run the container
docker run -d -p 3000:80 --name my-app my-app:latest

# Using docker-compose
docker-compose up -d
```

## Configuration

The plugin includes configurations for:
- vite.config.ts with path aliases and Vitest config
- tsconfig.json with path mappings
- Vitest setup with demo test examples
- ESLint + Prettier
- Husky git hooks
- Dockerfile with multi-stage build
- nginx.conf with security headers and compression
- docker-compose.yml for easy orchestration

## Author

Eric Wu (tanker327@gmail.com)

## License

MIT
