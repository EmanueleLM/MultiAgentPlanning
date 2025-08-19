(define (problem unlock-environment-problem)
  (:domain unlock-environment)
  (:objects
    agent_r agent_g agent_b - agent
    red_switch green_switch blue_switch - switch
    room_door - door)
  
  (:init
    (door-locked)
    (can-press agent_r red_switch)
    (can-press agent_g green_switch)
    (can-press agent_b blue_switch)
    (acting agent_r)
    (acting agent_g)
    (acting agent_b)
    (not (switch-pressed red_switch))
    (not (switch-pressed green_switch))
    (not (switch-pressed blue_switch))
    (not (door-unlocked room_door))
  )
  
  (:goal 
    (door-unlocked room_door))
)