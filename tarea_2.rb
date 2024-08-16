# Initial state: 3,4,3,1,2
# Luego de  1 día:  2,3,2,0,1
# Luego de  2 días: 1,2,1,6,0,8
# Luego de  3 días: 0,1,0,5,6,7,8
# Luego de  4 días: 6,0,6,4,5,6,7,8,8
# Luego de  5 días: 5,6,5,3,4,5,6,7,7,8
# Luego de  6 días: 4,5,4,2,3,4,5,6,6,7
# Luego de  7 días: 3,4,3,1,2,3,4,5,5,6
# Luego de  8 días: 2,3,2,0,1,2,3,4,4,5
# Luego de  9 días: 1,2,1,6,0,1,2,3,3,4,8
# Luego de 10 días: 0,1,0,5,6,0,1,2,2,3,7,8
# Luego de 11 días: 6,0,6,4,5,6,0,1,1,2,6,7,8,8,8
# Luego de 12 días: 5,6,5,3,4,5,6,0,0,1,5,6,7,7,7,8,8
# Luego de 13 días: 4,5,4,2,3,4,5,6,6,0,4,5,6,6,6,7,7,8,8
# Luego de 14 días: 3,4,3,1,2,3,4,5,5,6,3,4,5,5,5,6,6,7,7,8
# Luego de 15 días: 2,3,2,0,1,2,3,4,4,5,2,3,4,4,4,5,5,6,6,7
# Luego de 16 días: 1,2,1,6,0,1,2,3,3,4,1,2,3,3,3,4,4,5,5,6,8
# Luego de 17 días: 0,1,0,5,6,0,1,2,2,3,0,1,2,2,2,3,3,4,4,5,7,8
# Luego de 18 días: 6,0,6,4,5,6,0,1,1,2,6,0,1,1,1,2,2,3,3,4,6,7,8,8,8,8

# El objetivo en síntesis no es almacenar cada alien, sino cuántos hay en total.
# Para ello, se almacena en un array cuántos aliens hay de cada edad, para luego
# sumar cuántos hay al final del día a consultar.

class Alien
  BORN = 6 # Conteo desde el día 7 hacia atrás para aliens adultos.
  NEWBORN = 8 # Conteo desde el día 9 hacia atrás para nuevos aliens.
  
  def self.population(days)
    # [0,0,0,0,0,0,0,0,0]
    age_groups = Array.new(NEWBORN + 1, 0)
    @population = [3,4,3,1,2]
  
    # [0,1,1,2,1,0,0,0,0]
    @population.each do |age|
      age_groups[age] += 1
    end

    days.times do
      # Aliens que nacerán
      new_aliens = age_groups[0]

      # Se mueven los aliens al indice anterior, dejando el último
      # indice como 0. Este movimiento simula el conteo regresivo de
      # los aliens
      age_groups = age_groups[1..NEWBORN] + [0]

      # Se "regresan" los aliens adultos al conteo de nacimiento
      # para que vuelvan a reproducirse
      age_groups[BORN] += new_aliens

      # Se agregan al último índice los aliens nacidos
      age_groups[NEWBORN] = new_aliens
    end

    # Finalmente, se suman los aliens para hacer su conteo.
    p age_groups.sum
  end
end

puts 'Ingrese dias a analizar: '
days = gets.chomp.to_i
Alien.population(days)
