(define (domain childsnack)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    child sandwich
  )
  (:predicates
    (is_gf ?s - sandwich)
    (is_allergic ?c - child)
    (sandwich_ready ?s - sandwich)
    (child_served ?c - child)
    (safe_to_serve ?c - child ?s - sandwich)
  )
  
  (:functions
    (total-cost)
  )

  (:action prepare_regular_sandwich
    :parameters (?s - sandwich)
    :precondition (and 
      (not (sandwich_ready ?s))
      (not (is_gf ?s))
    )
    :effect (and 
      (sandwich_ready ?s)
      (increase (total-cost) 1)
    )
  )

  (:action prepare_gf_sandwich
    :parameters (?s - sandwich)
    :precondition (and 
      (not (sandwich_ready ?s))
      (is_gf ?s)
    )
    :effect (and 
      (sandwich_ready ?s)
      (increase (total-cost) 1)
    )
  )

  (:action serve_snack
    :parameters (?c - child ?s - sandwich)
    :precondition (and 
      (sandwich_ready ?s)
      (not (child_served ?c))
      (safe_to_serve ?c ?s)
    )
    :effect (and 
      (child_served ?c)
      (not (sandwich_ready ?s))
      (increase (total-cost) 1)
    )
  )
)