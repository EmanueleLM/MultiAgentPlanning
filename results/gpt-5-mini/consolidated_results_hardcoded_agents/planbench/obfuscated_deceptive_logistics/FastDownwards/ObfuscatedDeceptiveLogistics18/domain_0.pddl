(define (domain linking-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent obj)

  (:predicates
    ;; Directed successor link: (next x y) means x's next element is y.
    (next ?x - obj ?y - obj)
    ;; Bookkeeping predicates to prevent multiple outgoing/incoming links.
    (has-next ?x - obj)   ;; true when ?x already has a next
    (has-prev ?y - obj)   ;; true when ?y already has a previous
    ;; Simple agent availability precondition so actions are performed by an agent.
    (available-agent ?a - agent)
  )

  ;; Link action: create a directed next relation x -> y.
  ;; Preconditions:
  ;;  - the performing agent must be available,
  ;;  - x must not already have a next,
  ;;  - y must not already have a previous.
  ;; Effects:
  ;;  - establish (next x y),
  ;;  - mark x as having a next and y as having a previous.
  ;; This domain intentionally omits any "undo" or "pay shortfall" actions:
  ;; once a next/has-next/has-prev is created it cannot be removed. This
  ;; enforces finality of ordering constraints as required.
  (:action link
    :parameters (?a - agent ?x - obj ?y - obj)
    :precondition (and
                    (available-agent ?a)
                    (not (has-next ?x))
                    (not (has-prev ?y))
                  )
    :effect (and
              (next ?x ?y)
              (has-next ?x)
              (has-prev ?y)
            )
  )
)