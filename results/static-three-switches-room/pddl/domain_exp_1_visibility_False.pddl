(define (domain multi-agent-switches)
  (:requirements :types :strips)

  ;; --------------------------------------------------------------
  ;; types
  ;; --------------------------------------------------------------
  (:types
    agent switch location
  )

  ;; --------------------------------------------------------------
  ;; predicates
  ;; --------------------------------------------------------------
  (:predicates
    (at ?a - agent ?l - location) ; where an agent is
    (connected ?l1 - location ?l2 - location)

    (switch-at ?s - switch ?l - location) ; location of each switch
    (pressed ?s - switch) ; switch has been pressed

    (door-open) ; the locked door is open
  )

  ;; --------------------------------------------------------------
  ;; actions
  ;; --------------------------------------------------------------
  ;; 1. Move an agent to any *connected* location
  (:action move
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (connected ?from ?to))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to))
  )

  ;; 2. Press a switch that the agent is standing on
  (:action press
    :parameters (?a - agent ?s - switch)
    :precondition (and
      (at ?a ?l)
      (switch-at ?s ?l)
      (not (pressed ?s)))
    :effect (pressed ?s)
  )

  ;; 3. Open the door only when *all* switches are pressed
  (:action open-door
    :parameters ()
    :precondition (and
      (pressed red)
      (pressed green)
      (pressed blue))
    :effect (door-open)
  )

)