extends Node2D

const tour_complet := 2 * PI
var biscuit_pos := Vector2(300,300)
var pacman_pos := Vector2(100,100)

#PACMAN BOUCHE
var delta_angle_pacman := 0.0
var angle_pacman_amplitude := 0.4
var angle_pacman_periode := 0.3

#Ceci utilise le sinus du cercle unitaire
var delta_angle_sourire := PI/4
var angle_sourire_amplitude := PI/12
var angle_sourire_periode := 3

#YEUX
var position_oeil_gauche := Vector2(-50,-50)
var position_oeil_droit := Vector2(50, -50)


func _draw() -> void:
    var centre := get_viewport_rect().get_center()
    var retine_droit := centre + position_oeil_droit # pos
    var retine_gauche := centre + position_oeil_gauche # pos
    draw_rect(get_viewport_rect(), Color.ROSY_BROWN)
    draw_circle(retine_gauche, 30, Color.AQUAMARINE, false, 3)
    draw_circle(retine_droit, 30, Color.AQUAMARINE, false, 3)

    var position_relative_oeil_biscuit := biscuit_pos - retine_droit
    var direction_vers_biscuit_droit := position_relative_oeil_biscuit.normalized()
    var pos_retine_droit := retine_droit + direction_vers_biscuit_droit * 18
    var position_relative_oeil_gauche := biscuit_pos - retine_gauche
    var direction_vers_biscuit_gauche := position_relative_oeil_gauche.normalized()
    var pos_retine_gauche := retine_gauche + direction_vers_biscuit_gauche * 18
    #draw_line(retine_droit, retine_droit + direction_vers_biscuit * 25, Color.PURPLE, 2)
    draw_circle(pos_retine_droit, 8, Color.BLACK, true, 3)
    draw_circle(pos_retine_gauche, 8, Color.BLACK, true, 3)


    draw_arc(centre + Vector2(0,50), 150, 0.5 - delta_angle_sourire, 2.78 + delta_angle_sourire, 20, Color.RED, 7)
    
    #VISAGE
    draw_polyline(
        [
            centre + Vector2(-200,-200),
            centre + Vector2(0, -70),
            centre + Vector2(200,-200),
            centre + Vector2(165,220),
            centre + Vector2(-165,220),
            centre + Vector2(-200,-200)
        ], Color.YELLOW, 3
    )

    #COOKIE
    draw_circle(biscuit_pos, 20, Color.BLANCHED_ALMOND)
    draw_circle(biscuit_pos+Vector2(-5,-5), 4, Color.CHOCOLATE)
    draw_circle(biscuit_pos+Vector2(7,2), 4, Color.CHOCOLATE)
    draw_circle(biscuit_pos+Vector2(-8,10), 4, Color.CHOCOLATE)

    #PACMAN
    draw_arc(pacman_pos, 45, 0.3 - delta_angle_pacman, 6 + delta_angle_pacman, 40, Color.YELLOW, 100)
    draw_circle(pacman_pos + Vector2(0, -50), 8, Color.BLACK)


#RENDU GRAPHIQUE À CHAQUE TICK
func _process(delta: float) -> void:  #delta = temps depuis le dernier frame

    var velocite := 225.0
    var deplacement := velocite * delta
    if Input.is_action_pressed('ui_right'):
        biscuit_pos.x += deplacement
    if Input.is_action_pressed('ui_left'):
        biscuit_pos.x -= deplacement
    if Input.is_action_pressed('ui_up'):
        biscuit_pos.y -= deplacement
    if Input.is_action_pressed('ui_down'):
        biscuit_pos.y += deplacement


    #BOUGER PACMAN
    var pos_rel_pacman := biscuit_pos - pacman_pos
    var direction_pacman := pos_rel_pacman.normalized()
    pacman_pos = pacman_pos + direction_pacman * 3
    

    var temps_courant_seconde = Time.get_ticks_msec() / 1000.0
    
    #Bouger le sourire
    delta_angle_sourire = angle_sourire_amplitude * sin(2*PI * temps_courant_seconde / angle_sourire_periode)

    #Bouche Pacman
    delta_angle_pacman = angle_pacman_amplitude * sin(2 * PI * temps_courant_seconde / angle_pacman_periode)
    queue_redraw()