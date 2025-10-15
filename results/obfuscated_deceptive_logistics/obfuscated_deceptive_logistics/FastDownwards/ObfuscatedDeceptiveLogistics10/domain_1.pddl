(define (domain multiagent_collect)
  (:requirements :typing :negative-preconditions)
  (:types agent object slot location texture)
  (:predicates
    (hand ?a - agent ?o - object)
    (cats ?l - location)
    (texture ?o - object ?t - texture)
    (vase ?o - object)
    (next ?s1 - slot ?s2 - slot)
    (sneeze ?a - agent)
    (spring ?o - object)
    (stupendous ?o - object)
    (collect ?a - agent ?o - object)
  )

  (:action player2_press_spring
    :parameters (?sp - object ?v - object ?s_from - slot ?s_to - slot ?s_next - slot)
    :precondition (and
      (spring ?sp)
      (vase ?v)
      (hand player2 empty)
      (next ?s_from ?s_to)
    )
    :effect (and
      (stupendous ?v)
      (not (next ?s_from ?s_to))
      (next ?s_to ?s_next)
    )
  )

  (:action player1_collect
    :parameters (?v - object ?s_from - slot ?s_to - slot ?s_next - slot)
    :precondition (and
      (vase ?v)
      (hand player1 empty)
      (stupendous ?v)
      (next ?s_from ?s_to)
    )
    :effect (and
      (collect player1 ?v)
      (hand player1 ?v)
      (not (hand player1 empty))
      (not (next ?s_from ?s_to))
      (next ?s_to ?s_next)
    )
  )

  (:action player1_sneeze
    :parameters (?loc - location)
    :precondition (and
      (cats ?loc)
    )
    :effect (and
      (sneeze player1)
    )
  )

  (:action player1_pet_cats
    :parameters (?loc - location)
    :precondition (and
      (cats ?loc)
      (hand player1 empty)
    )
    :effect (and
      (cats ?loc)
    )
  )

  (:action player2_inspect_texture
    :parameters (?v - object ?t - texture)
    :precondition (and
      (vase ?v)
      (hand player2 empty)
    )
    :effect (and
      (texture ?v ?t)
    )
  )

  (:action player2_collect
    :parameters (?obj - object ?s_from - slot ?s_to - slot ?s_next - slot)
    :precondition (and
      (hand player2 empty)
      (next ?s_from ?s_to)
    )
    :effect (and
      (collect player2 ?obj)
      (hand player2 ?obj)
      (not (hand player2 empty))
      (not (next ?s_from ?s_to))
      (next ?s_to ?s_next)
    )
  )
)