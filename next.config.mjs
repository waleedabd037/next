const nextConfig = {
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'placehold.co',
        port: "",
      },
    ],
  },
  experimental: {
    serverComponentsExternalPackages: ["pdf-parse"],
  },
  webpack: (config) => {
    config.module.rules.push({
      test: /\.gltf$/,
      type: 'asset/resource'
    });
    return config;
  }
};

export default nextConfig;