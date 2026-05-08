(define (domain orchestrated_next)
  ; Minimal assumptions made in this domain (documented as required by the user):
  ; - The three roles are represented as agent objects: acting_agent, observer, auditor.
  ; - Only acting_agent may perform the "set next" operation; observer may only confirm; auditor may only validate.
  ; - No initial (next ...) relations exist unless provided in environment public information (none were provided).
  ; - No transitive-cycle checks are available beyond preventing multiple predecessors/successors; cycles are not otherwise prevented.
  (:requirements :typing :negative-preconditions :strips)
  (:types agent obj)

  (:predicates
    ; structural relation: x's successor is y
    (next ?x - obj ?y - obj)

    ; bookkeeping to forbid multiple successors/predecessors
    (has-successor ?x - obj)
    (has-predecessor ?y - obj)

    ; staged approvals to enforce ordered sequence
    (confirmed ?x - obj ?y - obj)
    (validated ?x - obj ?y - obj)

    ; capability markers to bind actions to provenance (who can do what)
    (can-act ?a - agent)
    (can-observe ?a - agent)
    (can-audit ?a - agent)
  )

  ; Acting agent action: creates the next relation (only if source has no successor and target has no predecessor)
  (:action acting_set_next
    :parameters (?ag - agent ?from - obj ?to - obj)
    :precondition (and
                    (can-act ?ag)
                    (not (has-successor ?from))
                    (not (has-predecessor ?to))
                    (not (next ?from ?to))
                  )
    :effect (and
              (next ?from ?to)
              (has-successor ?from)
              (has-predecessor ?to)
            )
  )

  ; Observer action: may confirm an existing next relation (only after it was set)
  (:action observer_confirm_next
    :parameters (?ag - agent ?from - obj ?to - obj)
    :precondition (and
                    (can-observe ?ag)
                    (next ?from ?to)
                    (not (confirmed ?from ?to))
                  )
    :effect (confirmed ?from ?to)
  )

  ; Auditor action: may validate a confirmed next relation (only after confirmation)
  (:action auditor_validate_next
    :parameters (?ag - agent ?from - obj ?to - obj)
    :precondition (and
                    (can-audit ?ag)
                    (confirmed ?from ?to)
                    (not (validated ?from ?to))
                  )
    :effect (validated ?from ?to)
  )
)