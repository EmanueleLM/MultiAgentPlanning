(define (domain obfuscated_deceptive_logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    ;; unary role predicates
    (cats ?x - obj)
    (hand ?x - obj)
    (sneeze ?x - obj)
    (texture ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)

    ;; binary relations
    (collect ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)

    ;; time / stage indexed adjacency
    (next_at ?x - obj ?y - obj ?s - stage)

    ;; stage ordering
    (succ ?s1 - stage ?s2 - stage)
    (current_stage ?s - stage)
  )

  ;; Actions implement the original schemata.
  ;; Every action consumes the current stage and advances to its successor stage.
  ;; Preconditions that mention `next` are implemented by requiring the corresponding
  ;; stage-indexed predicate next_at at the current stage; effects add next_at at the
  ;; successor stage (when the original adds a next) or remove it at the current stage
  ;; (when the original deletes a next). This enforces contiguous occupancy and strict
  ;; forward time progression through stages.

  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s_prev - stage ?s_cur - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next_at ?o1 ?o2 ?s_prev)
      (current_stage ?s_prev)
      (succ ?s_prev ?s_cur)
    )
    :effect (and
      ;; time advance
      (not (current_stage ?s_prev))
      (current_stage ?s_cur)

      ;; add next_at at successor stage as specified
      (next_at ?o0 ?o2 ?s_cur)

      ;; delete vase as specified
      (not (vase ?o0 ?o1))
    )
  )

  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s_prev - stage ?s_cur - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next_at ?o0 ?o2 ?s_prev)
      (next_at ?o1 ?o2 ?s_prev)
      (current_stage ?s_prev)
      (succ ?s_prev ?s_cur)
    )
    :effect (and
      ;; time advance
      (not (current_stage ?s_prev))
      (current_stage ?s_cur)

      ;; add vase as specified
      (vase ?o0 ?o1)

      ;; remove the indicated next relation so it will not hold going forward
      (not (next_at ?o0 ?o2 ?s_prev))
    )
  )

  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s_prev - stage ?s_cur - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next_at ?o1 ?o2 ?s_prev)
      (next_at ?o0 ?o2 ?s_prev)
      (current_stage ?s_prev)
      (succ ?s_prev ?s_cur)
    )
    :effect (and
      ;; time advance
      (not (current_stage ?s_prev))
      (current_stage ?s_cur)

      ;; add vase
      (vase ?o0 ?o1)

      ;; delete next from the prior stage (so it's not present going forward)
      (not (next_at ?o0 ?o2 ?s_prev))
    )
  )

  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?s_prev - stage ?s_cur - stage)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next_at ?o0 ?o1 ?s_prev)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (current_stage ?s_prev)
      (succ ?s_prev ?s_cur)
    )
    :effect (and
      ;; time advance
      (not (current_stage ?s_prev))
      (current_stage ?s_cur)

      ;; add the new next at successor stage
      (next_at ?o0 ?o2 ?s_cur)

      ;; remove the prior next so it does not persist forward
      (not (next_at ?o0 ?o1 ?s_prev))
    )
  )

  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s_prev - stage ?s_cur - stage)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next_at ?o0 ?o1 ?s_prev)
      (current_stage ?s_prev)
      (succ ?s_prev ?s_cur)
    )
    :effect (and
      ;; time advance
      (not (current_stage ?s_prev))
      (current_stage ?s_cur)

      ;; add the new next at successor stage
      (next_at ?o0 ?o2 ?s_cur)

      ;; remove the prior next
      (not (next_at ?o0 ?o1 ?s_prev))
    )
  )

  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s_prev - stage ?s_cur - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next_at ?o1 ?o2 ?s_prev)
      (vase ?o0 ?o1)
      (current_stage ?s_prev)
      (succ ?s_prev ?s_cur)
    )
    :effect (and
      ;; time advance
      (not (current_stage ?s_prev))
      (current_stage ?s_cur)

      ;; add next at successor stage
      (next_at ?o0 ?o2 ?s_cur)

      ;; delete vase (so it will not hold going forward)
      (not (vase ?o0 ?o1))
    )
  )
)