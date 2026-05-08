(define (domain meeting-planning-example3)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time metcount person)

  (:constants bayview golden-gate-park - location
              barbara - person)

  (:predicates
    (at ?loc - location)                         ; travel location of traveler
    (at-person ?p - person ?loc - location)     ; person located somewhere (static)
    (now ?t - time)                              ; current minute tick
    (plus1 ?t1 ?t2 - time)                       ; successor by 1 minute
    (plus22 ?t1 ?t2 - time)                      ; Bayview -> Golden Gate Park travel duration
    (plus23 ?t1 ?t2 - time)                      ; Golden Gate Park -> Bayview travel duration
    (allowed-meet ?t - time)                     ; 1-minute meeting starting at ?t fits in availability
    (have-met ?m - metcount)                     ; met counter (discrete minutes accrued)
    (nextmet ?m1 ?m2 - metcount)                 ; successor relation on metcount
    (meeting-active)                              ; true while the contiguous meeting block is ongoing
  )

  ;; Move from Bayview to Golden Gate Park: advances time by 22 minutes, requires not meeting-active
  (:action move-bayview-to-ggp
    :parameters (?t1 ?t2 - time)
    :precondition (and (at bayview) (now ?t1) (plus22 ?t1 ?t2) (not (meeting-active)))
    :effect (and (not (at bayview)) (at golden-gate-park) (not (now ?t1)) (now ?t2))
  )

  ;; Move from Golden Gate Park to Bayview: advances time by 23 minutes, requires not meeting-active
  (:action move-ggp-to-bayview
    :parameters (?t1 ?t2 - time)
    :precondition (and (at golden-gate-park) (now ?t1) (plus23 ?t1 ?t2) (not (meeting-active)))
    :effect (and (not (at golden-gate-park)) (at bayview) (not (now ?t1)) (now ?t2))
  )

  ;; Wait one minute (idle), not allowed during meeting-active
  (:action wait-1min
    :parameters (?t1 ?t2 - time)
    :precondition (and (now ?t1) (plus1 ?t1 ?t2) (not (meeting-active)))
    :effect (and (not (now ?t1)) (now ?t2))
  )

  ;; Start the contiguous meeting block of 1 minute (first minute).
  ;; Restriction: meeting may be started only if no meeting minutes have been accrued yet (have-met m0),
  ;; ensuring the meeting minutes form a single contiguous block.
  (:action meet-start-1min
    :parameters (?t1 ?t2 - time ?m1 ?m2 - metcount)
    :precondition (and (at golden-gate-park) (now ?t1) (plus1 ?t1 ?t2) (allowed-meet ?t1)
                       (have-met ?m1) (nextmet ?m1 ?m2) (not (meeting-active)))
    :effect (and (not (now ?t1)) (now ?t2) (not (have-met ?m1)) (have-met ?m2) (meeting-active))
  )

  ;; Continue the contiguous meeting block for another minute.
  ;; Requires meeting_active and that the next metcount transition is available.
  (:action meet-continue-1min
    :parameters (?t1 ?t2 - time ?m1 ?m2 - metcount)
    :precondition (and (at golden-gate-park) (now ?t1) (plus1 ?t1 ?t2) (allowed-meet ?t1)
                       (have-met ?m1) (nextmet ?m1 ?m2) (meeting-active))
    :effect (and (not (now ?t1)) (now ?t2) (not (have-met ?m1)) (have-met ?m2) (meeting-active))
  )

  ;; Stop the meeting block. This action is only allowed once the required contiguous meeting minutes
  ;; have been reached (i.e., have-met m90). This prevents premature stopping and prevents multiple
  ;; separated meeting blocks.
  (:action meet-stop
    :parameters (?t - time)
    :precondition (and (now ?t) (meeting-active) (at golden-gate-park))
    :effect (and (not (meeting-active)))
  )
)