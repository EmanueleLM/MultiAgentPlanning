(define (domain meeting-domain)
  (:requirements :typing :negative-preconditions :fluents :action-costs)
  (:types agent location moment)
  (:predicates
    (at ?a - agent ?l - location)
    (at-time ?t - moment)
    (met-105)
    (met-360)
  )
  (:functions (total-cost))

  (:action visitor-travel-presidio-to-unionsq
    :parameters ()
    :precondition (and (at visitor presidio) (at-time m540))
    :effect (and
      (not (at visitor presidio))
      (at visitor unionsq)
      (not (at-time m540))
      (at-time m562)
      (increase (total-cost) 0)
    )
  )

  (:action visitor-wait-until-675
    :parameters ()
    :precondition (and (at visitor unionsq) (at-time m562))
    :effect (and
      (not (at-time m562))
      (at-time m675)
      (increase (total-cost) 0)
    )
  )

  (:action visitor-andrew-meet-105
    :parameters ()
    :precondition (and (at visitor unionsq) (at andrew unionsq) (at-time m675))
    :effect (and
      (not (at-time m675))
      (at-time m780)
      (met-105)
      (increase (total-cost) 105)
    )
  )

  (:action visitor-andrew-meet-extra-255
    :parameters ()
    :precondition (and (met-105) (at visitor unionsq) (at andrew unionsq) (at-time m780))
    :effect (and
      (not (at-time m780))
      (at-time m1035)
      (met-360)
      (increase (total-cost) 255)
    )
  )

  (:action andrew-travel-unionsq-to-presidio
    :parameters ()
    :precondition (and (at andrew unionsq) (at-time m675))
    :effect (and
      (not (at andrew unionsq))
      (at andrew presidio)
      (increase (total-cost) 0)
    )
  )

  (:action andrew-travel-presidio-to-unionsq
    :parameters ()
    :precondition (and (at andrew presidio) (at-time m675))
    :effect (and
      (not (at andrew presidio))
      (at andrew unionsq)
      (increase (total-cost) 0)
    )
  )
)