require "pry"

#version 1.0
class Player
attr_accessor :name, :life_points

  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 10
  end

  def show_state
     print "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage_get)
    @damage_get = damage_get.to_i
    @life_points = @life_points - @damage_get
    if @life_points <= 0
      puts "le joueur #{name} a été tué !"
    end
  end

  def attacks(other_player)
    puts "#{name} attaque #{other_player.name}"
    damage = compute_damage
    other_player.gets_damage(damage)
    puts "il lui inflige #{damage} points de dommages."
  end

  def compute_damage
    return rand (1..6)
  end

end

#version 2.0

class HumanPlayer < Player
attr_accessor :weapon_level
@weapon_level = 100.to_i

  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
   print "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
    puts "#{@name} inflige #{@compute_damage} de dégâts"
  end

  def search_weapon
    @new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if @new_weapon > @weapon_level
      weapon_level = new_weapon
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle.."
    end

  end

end
