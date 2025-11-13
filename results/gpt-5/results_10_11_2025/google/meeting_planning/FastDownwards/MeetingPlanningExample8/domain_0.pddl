(define (domain schedule-stephanie-window)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location time
  )
  (:predicates
    (time-step ?t - time)
    (next ?t - time ?t2 - time)
    (within-window ?t - time)
    (at ?t - time)                    ; current time pointer
    (agent-at ?l - location)          ; agent's current location
    (edge1 ?from - location ?to - location) ; directed 1-minute travel edge (none provided/used)
    (met-stephanie-at-tk ?t - time)   ; met Stephanie at minute t
    (need-meet ?t - time)             ; gating predicate to enforce contiguity
    (chain-member ?t - time)          ; the required 105-minute contiguous block
  )

  ; Move forward one minute along a directed edge (per-minute compiled travel).
  ; Not applicable here because no edges are provided.
  (:action move
    :parameters (?t - time ?t2 - time ?from - location ?to - location)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (within-window ?t)
      (agent-at ?from)
      (edge1 ?from ?to)
      (not (need-meet ?t))            ; cannot skip required meet minutes
    )
    :effect (and
      (not (at ?t))
      (at ?t2)
      (not (agent-at ?from))
      (agent-at ?to)
    )
  )

  ; Wait exactly one minute (advance time without moving) when no meeting is required this minute.
  (:action wait
    :parameters (?t - time ?t2 - time ?l - location)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (within-window ?t)
      (agent-at ?l)
      (not (need-meet ?t))            ; cannot skip required meet minutes
    )
    :effect (and
      (not (at ?t))
      (at ?t2)
    )
  )

  ; Meet Stephanie at minute t and unlock the next required minute when it is inside the chain.
  (:action meet-stephanie-next
    :parameters (?t - time ?t2 - time ?l - location)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (within-window ?t)
      (agent-at ?l)
      (need-meet ?t)
      (chain-member ?t2)              ; next minute is still within the required block
      (not (met-stephanie-at-tk ?t))
    )
    :effect (and
      (not (at ?t))
      (at ?t2)
      (met-stephanie-at-tk ?t)
      (not (need-meet ?t))
      (need-meet ?t2)                 ; enforce contiguity
    )
  )

  ; Meet Stephanie at the final minute of the required block (do not unlock a further requirement).
  (:action meet-stephanie-final
    :parameters (?t - time ?t2 - time ?l - location)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (within-window ?t)
      (agent-at ?l)
      (need-meet ?t)
      (not (chain-member ?t2))        ; next minute is outside the required block
      (not (met-stephanie-at-tk ?t))
    )
    :effect (and
      (not (at ?t))
      (at ?t2)
      (met-stephanie-at-tk ?t)
      (not (need-meet ?t))
    )
  )
)