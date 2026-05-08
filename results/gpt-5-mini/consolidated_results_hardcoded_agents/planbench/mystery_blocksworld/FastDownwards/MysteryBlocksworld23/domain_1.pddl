(define (domain mysteryblocksworld23)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (craves ?o - obj ?p - obj)    ; ?o craves ?p
    (harmony)                     ; global harmony phase
    (pain)                        ; global pain phase
    (planet ?o - obj)             ; ?o is a planet
    (province ?o - obj)           ; ?o is a province
    (attacked ?o - obj)           ; bookkeeping: ?o was attacked and awaits possible succumb
  )

  ; Attack action: requires a target that is both province and planet, and global harmony.
  ; Effects: enter pain phase, remove province & planet & harmony for that object, mark attacked.
  (:action attack
    :parameters (?x - obj)
    :precondition (and
                    (province ?x)
                    (planet ?x)
                    (harmony)
                   )
    :effect (and
              (pain)
              (not (province ?x))
              (not (planet ?x))
              (not (harmony))
              (attacked ?x)
            )
  )

  ; Succumb action: resolves a specific attacked object under pain, restoring that object's province & planet and harmony.
  ; Removes the global pain and the attacked marker.
  (:action succumb
    :parameters (?x - obj)
    :precondition (and
                    (pain)
                    (attacked ?x)
                   )
    :effect (and
              (province ?x)
              (planet ?x)
              (harmony)
              (not (pain))
              (not (attacked ?x))
            )
  )

  ; Overcome action: given a province held by ?y during pain, transfer province to ?x, create craving (craves ?x ?y),
  ; restore harmony, and consume the province ?y and the pain marker.
  (:action overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and
                    (province ?y)
                    (pain)
                   )
    :effect (and
              (harmony)
              (province ?x)
              (craves ?x ?y)
              (not (province ?y))
              (not (pain))
            )
  )

  ; Feast action: when an object ?x currently craves ?y and holds a province during harmony,
  ; consume the craving, transfer the province back to ?y, enter pain, and remove harmony.
  (:action feast
    :parameters (?x - obj ?y - obj)
    :precondition (and
                    (craves ?x ?y)
                    (province ?x)
                    (harmony)
                   )
    :effect (and
              (pain)
              (province ?y)
              (not (craves ?x ?y))
              (not (province ?x))
              (not (harmony))
            )
  )

)