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
#               [6, 0, 6, 4, 5, 6, 0, 1, 1, 2, 6, 0, 1, 1, 1, 2, 2, 3, 3, 4, 6, 7, 8, 8, 8, 8]

# @alien_population = [3,4,3,1,2]
class Alien
  BORN = 6
  NEWBORN = 8
  
  def self.population(days)
    age_groups = Array.new(NEWBORN + 1, 0)
    @population = [3,4,3,1,2]
  
    @population.each do |age|
      age_groups[age] += 1
    end

    days.times do
      new_aliens = age_groups[0]

      age_groups = age_groups[1..NEWBORN] + [0]

      age_groups[BORN] += new_aliens
      age_groups[NEWBORN] = new_aliens
    end
    p age_groups.sum
  end
end

puts 'Ingrese dias a analizar: '
days = gets.chomp.to_i
Alien.population(days)
