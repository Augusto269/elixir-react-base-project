import { useEffect, useState } from "react";

const App: React.FC = () => {
  const [message, setMessage] = useState<string>("");

  useEffect(() => {
    fetch("/api/hello")
      .then((res) => res.json())
      .then((data) => setMessage(data.message))
      .catch((err) => console.error("Error fetching API:", err));
  }, []);

  return (
    <div>
      <h1>React + TypeScript + Phoenix</h1>
      <p>Mensaje desde el backend: {message}</p>
    </div>
  );
};

export default App;
