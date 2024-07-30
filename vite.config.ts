import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    host: "0.0.0.0", // 允许从所有网络接口访问
    port: 5173, // 设置服务器端口
    watch: {
      usePolling: true, // 开启热更新
    },
  },
});
