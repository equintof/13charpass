$words = @( "Gato", "Casa", "Sol", "Luz", "Rio", "Mar", "Lago", "Roca", "Fuego", "Agua", "Tren", "Barco", "Coche", "Avion", "Nube", "Reloj", "Silla", "Mesa", "Libro", "Lapiz", "Raton", "Nave", "Venus", "Marte", "Luna", "Crear", "Pintar", "Leer",
"Arco", "Brisa", "Cielo", "Danza", "Eco", "Foco", "Gota", "Hilo", "Isla", "Joya", "Koala", "Llama", "Menta", "Norte", "Oasis", "Pista", "Quiza", "Ritmo", "Sombra", "Trigo", "Unico", "Voz", "Whist", "Xenon", "Yermo", "Zorro",
"Ala", "Boca", "Cara", "Dato", "Enfo", "Filo", "Gema", "Humo", "Idea", "Jugo", "Kiwi", "Liso", "Muro", "Nube", "Onda", "Plomo", "Quema", "Roca", "Suave", "Tinto", "Uva", "Valle", "Wafle", "Xilof", "Yate", "Zorro",
"Amo", "Beso", "Cine", "Dado", "Eco", "Fila", "Giro", "Hada", "Iris", "Juez", "Kilo", "Luna", "Miel", "Nota", "Orbe", "Pez", "Queso", "Rayo", "Sano", "Taza", "Uva", "Vida", "Web", "Xeno", "Yeti", "Zeta",
"Rama", "Tiza", "Nudo", "Perl", "Muro", "Sal", "Pico", "Nido", "Bota", "Cola", "Duro", "Fino", "Gris", "Humo", "Jota", "Lobo", "Masa", "Nudo", "Orla", "Paro", "Quep", "Rico", "Seda", "Tino", "Ural", "Voto", "Xero", "Yugo", "Zumo",
"Asa", "Baba", "Cama", "Dame", "Enzo", "Fuga", "Gana", "Huno", "Irma", "Jalo", "Kora", "Lira", "Muro", "Nexo", "Oso", "Puma", "Quis", "Riza", "Sapo", "Tapa", "Uro", "Viva", "Wati", "Xiri", "Yuca", "Zeda",
"Nido", "Pato", "Roca", "Vela", "Tina", "Loto", "Rama", "Mazo", "Foca", "Jugo", "Buzo", "Palo", "Lima", "Tilo", "Giro", "Muro", "Domo", "Vino", "Pino", "Coco", "Toro", "Loto", "Nudo", "Mota", "Faro", "Taza", "Zeta", "Humo", "Gema", "Bote",
"Cima", "Dado", "Gota", "Hada", "Iris", "Juez", "Koji", "Lobo", "Moto", "Nota", "Orbe", "Puma", "Quis", "Rayo", "Sano", "Taco", "Uva", "Vino", "Web", "Xilo", "Yeti", "Zumo", "Mazo", "Duro", "Fino", "Joya", "Hilo", "Lobo", "Seda", "Yema")

$symbols = "!@#$%^&*"
$numbers = "0123456789"

function Generate-Password {
    $phrase = ""
    
    # Seleccionar una palabra aleatoria
    $phrase += $words[(Get-Random -Minimum 0 -Maximum $words.Length)]
    
    # Agregar una letra minuscula y una mayuscula aleatoria
    $lowercase = [char](Get-Random -Minimum 97 -Maximum 123)
    $uppercase = [char](Get-Random -Minimum 65 -Maximum 91)
    $phrase += "$lowercase$uppercase"
    
    # Agregar un simbolo aleatorio
    $symbol = $symbols[(Get-Random -Minimum 0 -Maximum $symbols.Length)]
    $phrase += $symbol
    
    # Agregar un numero aleatorio
    $number = $numbers[(Get-Random -Minimum 0 -Maximum $numbers.Length)]
    $phrase += $number
    
    # Completar hasta llegar a 13 caracteres
    while ($phrase.Length -lt 13) {
        $phrase += $words[(Get-Random -Minimum 0 -Maximum $words.Length)]
    }
    
    # Asegurar que tenga exactamente 13 caracteres
    $phrase = $phrase.Substring(0,13)
    
    return $phrase
}

while ($true) {
    Clear-Host
    Write-Host "===========================" -ForegroundColor Yellow
    Write-Host " GENERADOR DE CONTRASENAS " -ForegroundColor Cyan
    Write-Host "===========================" -ForegroundColor Yellow
    
    for ($i = 0; $i -lt 5; $i++) {
        Write-Host "Contrasena $($i+1): " -NoNewline -ForegroundColor White
        Write-Host "$(Generate-Password)" -ForegroundColor Green
    }
    
    Write-Host "===========================" -ForegroundColor Yellow
    Read-Host "Presiona Enter para generar otras 5 contrasenas"
}
