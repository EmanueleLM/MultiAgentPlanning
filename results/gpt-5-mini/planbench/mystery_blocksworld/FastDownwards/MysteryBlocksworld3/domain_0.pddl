(define (domain provinces)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (harmony)
    (pain)
    (province ?x - obj)
    (planet ?x - obj)
    (craves ?x - obj ?y - obj)
    (attacked ?x - obj)
  )

  ;; Attack(object)
  ;; Preconditions: province(object), planet(object), harmony
  ;; Effects: adds pain and attacked(object); deletes province(object), planet(object), harmony
  (:action Attack
    :parameters (?o - obj)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and
              (pain)
              (attacked ?o)
              (not (province ?o))
              (not (planet ?o))
              (not (harmony))
            )
  )

  ;; Succumb(object)
  ;; Preconditions: pain, attacked(object)
  ;; Effects: adds province(object), planet(object), harmony; deletes pain and attacked(object)
  (:action Succumb
    :parameters (?o - obj)
    :precondition (and (pain) (attacked ?o))
    :effect (and
              (province ?o)
              (planet ?o)
              (harmony)
              (not (pain))
              (not (attacked ?o))
            )
  )

  ;; Overcome(object, other_object)
  ;; Preconditions: province(other_object), pain
  ;; Effects: adds harmony, province(object), craves(object, other_object); deletes province(other_object), pain
  (:action Overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and (province ?other) (pain))
    :effect (and
              (harmony)
              (province ?o)
              (craves ?o ?other)
              (not (province ?other))
              (not (pain))
            )
  )

  ;; Feast(object, other_object)
  ;; Preconditions: craves(object, other_object), province(object), harmony
  ;; Effects: adds pain, province(other_object); deletes craves(object, other_object), province(object), harmony
  (:action Feast
    :parameters (?o - obj ?other - obj)
    :precondition (and (craves ?o ?other) (province ?o) (harmony))
    :effect (and
              (pain)
              (province ?other)
              (not (craves ?o ?other))
              (not (province ?o))
              (not (harmony))
            )
  )

)