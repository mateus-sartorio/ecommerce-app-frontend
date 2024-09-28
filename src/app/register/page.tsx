"use client";

import Box from "@mui/material/Box";
import TextField from "@mui/material/TextField";
import Button from "@mui/material/Button";
import { useRouter } from "next/navigation";

export default function Register() {
  const router = useRouter();

  function handleButtonClick() {
    router.push("/payment-details");
  }

  return (
    <Box component="form" sx={{ "& > :not(style)": { m: 1, width: "90%" } }} noValidate autoComplete="on">
      <div>
        <p>Informações pessoais</p>
        <TextField id="email-phone" label="Email ou celular" variant="filled" required />
        <TextField id="full-name" label="Nome completo" variant="filled" required />
      </div>

      <div>
        <p>Endereço</p>
        <TextField id="cep" label="CEP" variant="filled" required />
        <TextField id="house-number" label="Número" variant="filled" required />
        <TextField id="house-reference" label="Referência" variant="filled" />
      </div>

      <div>
        <p>Dados para nota fiscal</p>
        <TextField id="cpf" label="CPF" variant="filled" required />
      </div>

      <Button variant="contained" onClick={handleButtonClick}>
        Continuar para pagamento
      </Button>
    </Box>
  );
}
