(define (domain orchestrator-next-link)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (next ?from - obj ?to - obj)            ; directed successor link
    (has-successor ?x - obj)                ; x currently has some successor
    (has-predecessor ?x - obj)              ; x currently has some predecessor
  )

  ; Create a next link from ?from to ?to.
  ; Preconditions:
  ;   - ?from must not already have a successor
  ;   - ?to must not already have a predecessor
  ; Effects:
  ;   - establish next, and mark successor/predecessor occupancy
  (:action link
    :parameters (?from - obj ?to - obj)
    :precondition (and
      (not (has-successor ?from))
      (not (has-predecessor ?to))
    )
    :effect (and
      (next ?from ?to)
      (has-successor ?from)
      (has-predecessor ?to)
    )
  )

  ; Remove an existing next link from ?from to ?to.
  ; Preconditions:
  ;   - the exact link must exist
  ; Effects:
  ;   - remove the link and free successor/predecessor occupancy
  (:action unlink
    :parameters (?from - obj ?to - obj)
    :precondition (and
      (next ?from ?to)
    )
    :effect (and
      (not (next ?from ?to))
      (not (has-successor ?from))
      (not (has-predecessor ?to))
    )
  )
)