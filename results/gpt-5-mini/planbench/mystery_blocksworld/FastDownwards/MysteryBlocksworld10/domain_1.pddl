(define (domain orchestrator-domain)
  (:requirements :strips :typing)
  (:types agent)
  (:predicates
    (harmony)
    (province ?x - agent)
    (planet ?x - agent)
    (pain ?x - agent)
    (craves ?x - agent ?y - agent)
  )

  ;; Attack actions (one per agent). No parameters.
  (:action a_attack
    :parameters ()
    :precondition (and (province object_a) (planet object_a) (harmony))
    :effect (and
      (pain object_a)
      (not (province object_a))
      (not (planet object_a))
      (not (harmony))
    )
  )

  (:action b_attack
    :parameters ()
    :precondition (and (province object_b) (planet object_b) (harmony))
    :effect (and
      (pain object_b)
      (not (province object_b))
      (not (planet object_b))
      (not (harmony))
    )
  )

  (:action c_attack
    :parameters ()
    :precondition (and (province object_c) (planet object_c) (harmony))
    :effect (and
      (pain object_c)
      (not (province object_c))
      (not (planet object_c))
      (not (harmony))
    )
  )

  (:action d_attack
    :parameters ()
    :precondition (and (province object_d) (planet object_d) (harmony))
    :effect (and
      (pain object_d)
      (not (province object_d))
      (not (planet object_d))
      (not (harmony))
    )
  )

  ;; Feast actions: actor feasts on ?y
  ;; Preconditions: (craves actor ?y) (province actor) (harmony)
  ;; Effects: add pain(actor), add province(?y); delete craves(actor,?y), province(actor), harmony
  (:action a_feast
    :parameters (?y - agent)
    :precondition (and (craves object_a ?y) (province object_a) (harmony))
    :effect (and
      (pain object_a)
      (province ?y)
      (not (craves object_a ?y))
      (not (province object_a))
      (not (harmony))
    )
  )

  (:action b_feast
    :parameters (?y - agent)
    :precondition (and (craves object_b ?y) (province object_b) (harmony))
    :effect (and
      (pain object_b)
      (province ?y)
      (not (craves object_b ?y))
      (not (province object_b))
      (not (harmony))
    )
  )

  (:action c_feast
    :parameters (?y - agent)
    :precondition (and (craves object_c ?y) (province object_c) (harmony))
    :effect (and
      (pain object_c)
      (province ?y)
      (not (craves object_c ?y))
      (not (province object_c))
      (not (harmony))
    )
  )

  (:action d_feast
    :parameters (?y - agent)
    :precondition (and (craves object_d ?y) (province object_d) (harmony))
    :effect (and
      (pain object_d)
      (province ?y)
      (not (craves object_d ?y))
      (not (province object_d))
      (not (harmony))
    )
  )

  ;; Overcome actions: actor overcomes and begins to crave ?other
  ;; Preconditions: (province ?other) (pain actor)
  ;; Effects: add harmony, add province(actor), add craves(actor,?other); delete province(?other), delete pain(actor)
  (:action a_overcome
    :parameters (?other - agent)
    :precondition (and (province ?other) (pain object_a))
    :effect (and
      (harmony)
      (province object_a)
      (craves object_a ?other)
      (not (province ?other))
      (not (pain object_a))
    )
  )

  (:action b_overcome
    :parameters (?other - agent)
    :precondition (and (province ?other) (pain object_b))
    :effect (and
      (harmony)
      (province object_b)
      (craves object_b ?other)
      (not (province ?other))
      (not (pain object_b))
    )
  )

  (:action c_overcome
    :parameters (?other - agent)
    :precondition (and (province ?other) (pain object_c))
    :effect (and
      (harmony)
      (province object_c)
      (craves object_c ?other)
      (not (province ?other))
      (not (pain object_c))
    )
  )

  (:action d_overcome
    :parameters (?other - agent)
    :precondition (and (province ?other) (pain object_d))
    :effect (and
      (harmony)
      (province object_d)
      (craves object_d ?other)
      (not (province ?other))
      (not (pain object_d))
    )
  )

  ;; Succumb actions: remove pain and restore province, planet, harmony
  (:action a_succumb
    :parameters ()
    :precondition (and (pain object_a))
    :effect (and
      (province object_a)
      (planet object_a)
      (harmony)
      (not (pain object_a))
    )
  )

  (:action b_succumb
    :parameters ()
    :precondition (and (pain object_b))
    :effect (and
      (province object_b)
      (planet object_b)
      (harmony)
      (not (pain object_b))
    )
  )

  (:action c_succumb
    :parameters ()
    :precondition (and (pain object_c))
    :effect (and
      (province object_c)
      (planet object_c)
      (harmony)
      (not (pain object_c))
    )
  )

  (:action d_succumb
    :parameters ()
    :precondition (and (pain object_d))
    :effect (and
      (province object_d)
      (planet object_d)
      (harmony)
      (not (pain object_d))
    )
  )
)