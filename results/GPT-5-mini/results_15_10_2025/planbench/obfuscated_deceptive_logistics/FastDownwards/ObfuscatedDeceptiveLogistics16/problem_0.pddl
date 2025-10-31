(define (problem observer_reasoner_problem)
  (:domain observer_reasoner_domain)

  ;; No concrete objects, initial facts or goal atoms were provided
  ;; in the supplied inputs. Per instructions, do not invent objects,
  ;; initial atoms, preconditions, or effects beyond the listed
  ;; predicate symbols and action names. This problem is therefore a
  ;; minimal, syntactically valid container that can be filled with
  ;; grounded facts/goals when the missing STATEMENT blocks are supplied.
  (:objects)

  (:init)

  ;; Empty goal (no goal atoms were specified in the provided inputs).
  (:goal (and))
)