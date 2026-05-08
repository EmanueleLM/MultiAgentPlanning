(define (domain orchestrated_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types item)

  (:predicates
    (next ?a - item ?b - item)                       ; directed adjacency relation required by the goal
    (has-successor ?a - item)                        ; bookkeeping: object already has a successor (limits out-degree to 1)
    (has-predecessor ?a - item)                      ; bookkeeping: object has at least one predecessor (for auditor visibility)
    (validated-by-analyst ?a - item ?b - item)      ; auditor/analyst confirmation predicate (optional verification step)
  )

  ;; Player action: create a 'next' link from ?x to ?y.
  ;; Auditor-recommended bookkeeping: prevent multiple successors for a single object by requiring (not (has-successor ?x)).
  ;; No action can remove or alter 'next' once added (monotonic construction).
  (:action player_link
    :parameters (?x - item ?y - item)
    :precondition (and
                    (not (next ?x ?y))
                    (not (has-successor ?x))
                    (not (= ?x ?y))
                  )
    :effect (and
              (next ?x ?y)
              (has-successor ?x)
              (has-predecessor ?y)
            )
  )

  ;; Analyst action: explicitly validates an existing next relation. This action is provided to keep
  ;; verification steps separate and to preserve agent-distinct actions as requested.
  ;; It requires the link to already exist and marks it validated; it cannot create links.
  (:action analyst_validate
    :parameters (?x - item ?y - item)
    :precondition (and
                    (next ?x ?y)
                    (not (validated-by-analyst ?x ?y))
                  )
    :effect (validated-by-analyst ?x ?y)
  )
)