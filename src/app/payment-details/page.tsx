"use client";

import { Box, TextField, Button, FormControl, RadioGroup, FormLabel, Radio } from "@mui/material";
import Checkbox from "@mui/material/Checkbox";
import FormGroup from "@mui/material/FormGroup";
import FormControlLabel from "@mui/material/FormControlLabel";
import { useRouter } from "next/navigation";

export default function PaymentDetails() {
  const router = useRouter();

  function handleButtonClick() {
    router.push("/pix-payment");
  }

  return (
    <FormControl>
      <FormLabel id="demo-radio-buttons-group-label">Forma de pagamento</FormLabel>
      <RadioGroup aria-labelledby="demo-radio-buttons-group-label" defaultValue="female" name="radio-buttons-group">
        <FormControlLabel value="female" control={<Radio />} label="PIX" />
        <FormControlLabel value="male" control={<Radio />} label="Cartão de crédito" />
      </RadioGroup>

      <FormGroup>
        <FormControlLabel control={<Checkbox defaultChecked />} label="Salvar dados para comprar mais rápido  " />
      </FormGroup>

      <Button variant="contained" onClick={handleButtonClick}>
        Fazer pedido
      </Button>
    </FormControl>
  );
}
