(define (domain day_meetings)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location time person ofriend count bcount tcount
  )

  (:predicates
    (at ?l - location)
    (current-time ?t - time)
    (next ?t1 - time ?t2 - time)

    (avail ?p - person ?l - location ?t - time)

    (met ?p - person)
    (decided ?p - ofriend)

    ; 5–10 min buffer enforcement (use 5 as hard minimum) per location
    (buf ?l - location ?b - bcount)
    (next-b ?b1 - bcount ?b2 - bcount)

    ; David meeting chain (contiguous minutes)
    (meeting-david)
    (david-progress ?c - count)
    (next-count ?c1 - count ?c2 - count)
    (is-final-david ?c - count) ; marks the terminal 105-minute progress value

    ; Exact 23-minute travel modeled as a 23-step chain
    (in-transit)
    (dest-ct)
    (dest-ggp)
    (travel-rem ?tc - tcount)
    (next-tc ?tc1 - tcount ?tc2 - tcount)
  )

  (:functions (total-cost))

  ; Wait idle for 1 minute (discouraged by small cost)
  (:action wait-minute
    :parameters (?t1 - time ?t2 - time ?l - location)
    :precondition (and
      (current-time ?t1)
      (next ?t1 ?t2)
      (at ?l)
      (not (in-transit))
      (not (meeting-david))
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (increase (total-cost) 1)
    )
  )

  ; Buffer tick (consume 1 minute toward the 5-minute local buffer)
  (:action buffer-tick
    :parameters (?t1 - time ?t2 - time ?l - location ?b1 - bcount ?b2 - bcount)
    :precondition (and
      (current-time ?t1)
      (next ?t1 ?t2)
      (at ?l)
      (buf ?l ?b1)
      (next-b ?b1 ?b2)
      (not (in-transit))
      (not (meeting-david))
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (not (buf ?l ?b1))
      (buf ?l ?b2)
      (increase (total-cost) 1)
    )
  )

  ; Start travel from Golden Gate Park to Chinatown (exact 23 minutes via ticks)
  (:action start-travel-ggp-ct
    :parameters ()
    :precondition (and
      (at GoldenGatePark)
      (not (in-transit))
      (not (meeting-david))
    )
    :effect (and
      (not (at GoldenGatePark))
      (in-transit)
      (dest-ct)
      (travel-rem tc23)
    )
  )

  ; Start travel from Chinatown to Golden Gate Park
  (:action start-travel-ct-ggp
    :parameters ()
    :precondition (and
      (at Chinatown)
      (not (in-transit))
      (not (meeting-david))
    )
    :effect (and
      (not (at Chinatown))
      (in-transit)
      (dest-ggp)
      (travel-rem tc23)
    )
  )

  ; One-minute travel tick (advances time and reduces remaining travel minutes)
  (:action travel-tick
    :parameters (?t1 - time ?t2 - time ?r1 - tcount ?r2 - tcount)
    :precondition (and
      (in-transit)
      (travel-rem ?r1)
      (next-tc ?r1 ?r2)
      (current-time ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (not (travel-rem ?r1))
      (travel-rem ?r2)
      (increase (total-cost) 1) ; travel minute
    )
  )

  ; Finish travel into Chinatown
  (:action finish-travel-to-ct
    :parameters ()
    :precondition (and
      (in-transit)
      (dest-ct)
      (travel-rem tc0)
    )
    :effect (and
      (not (in-transit))
      (not (dest-ct))
      (at Chinatown)
    )
  )

  ; Finish travel into Golden Gate Park
  (:action finish-travel-to-ggp
    :parameters ()
    :precondition (and
      (in-transit)
      (dest-ggp)
      (travel-rem tc0)
    )
    :effect (and
      (not (in-transit))
      (not (dest-ggp))
      (at GoldenGatePark)
    )
  )

  ; Meet any optional friend for 1 minute (earns 'decided' and 'met'), requires local buffer cleared
  (:action meet-optional
    :parameters (?p - ofriend ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (current-time ?t1)
      (next ?t1 ?t2)
      (at ?l)
      (avail ?p ?l ?t1)
      (buf ?l b0)
      (not (met ?p))
      (not (in-transit))
      (not (meeting-david))
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (met ?p)
      (decided ?p)
      (not (buf ?l b0))
      (buf ?l b5)
      ; meeting minute has no cost to encourage meetings; buffer/wait/travel impose costs
    )
  )

  ; Skipping an optional friend (penalized) to ensure all 'decided' goals are achievable
  (:action skip-optional
    :parameters (?p - ofriend ?t1 - time ?t2 - time ?l - location)
    :precondition (and
      (current-time ?t1)
      (next ?t1 ?t2)
      (at ?l)
      (not (met ?p))
      (not (decided ?p))
      (not (in-transit))
      (not (meeting-david))
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (decided ?p)
      (increase (total-cost) 1000)
    )
  )

  ; Begin David meeting (consumes 1 minute and enters contiguous meeting mode)
  (:action start-david
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current-time ?t1)
      (next ?t1 ?t2)
      (at Chinatown)
      (avail david Chinatown ?t1)
      (buf Chinatown b0)
      (not (met david))
      (not (meeting-david))
      (not (in-transit))
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (meeting-david)
      (david-progress c1)
    )
  )

  ; Continue David meeting for a non-final minute
  (:action continue-david
    :parameters (?t1 - time ?t2 - time ?c1 - count ?c2 - count)
    :precondition (and
      (meeting-david)
      (david-progress ?c1)
      (next-count ?c1 ?c2)
      (not (is-final-david ?c2))
      (current-time ?t1)
      (next ?t1 ?t2)
      (at Chinatown)
      (avail david Chinatown ?t1)
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (not (david-progress ?c1))
      (david-progress ?c2)
    )
  )

  ; Final minute of David meeting: achieves met(david), clears meeting mode, and imposes local buffer
  (:action continue-david-final
    :parameters (?t1 - time ?t2 - time ?c1 - count ?c2 - count)
    :precondition (and
      (meeting-david)
      (david-progress ?c1)
      (next-count ?c1 ?c2)
      (is-final-david ?c2) ; reaching 105 minutes
      (current-time ?t1)
      (next ?t1 ?t2)
      (at Chinatown)
      (avail david Chinatown ?t1)
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (not (david-progress ?c1))
      (not (meeting-david))
      (met david)
      (not (buf Chinatown b0))
      (buf Chinatown b5)
    )
  )

  (:metric minimize (total-cost))
)