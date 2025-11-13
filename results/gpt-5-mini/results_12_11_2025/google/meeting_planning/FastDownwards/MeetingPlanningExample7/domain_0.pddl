(define (domain meet-john)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    (at ?l - location ?t - time)
    (travel17 ?from - location ?to - location)
    (travel18 ?from - location ?to - location)
    (plus ?t1 - time ?t2 - time)        ; generic allowed wait jump
    (plus17 ?t1 - time ?t2 - time)      ; t2 = t1 + 17
    (plus18 ?t1 - time ?t2 - time)      ; t2 = t1 + 18
    (plus75 ?t1 - time ?t2 - time)      ; t2 = t1 + 75
    (john-available-start ?t - time)    ; allowed meeting-start times for John
    (is-north-beach ?l - location)
    (met-john)
    (meeting-start ?t - time)
    (meeting-end ?t - time)
  )

  ;; Wait: remain at same location while advancing time according to an allowed plus pair.
  (:action wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?loc ?t1) (plus ?t1 ?t2))
    :effect (and (not (at ?loc ?t1)) (at ?loc ?t2))
  )

  ;; Move taking 17 minutes (Richmond District -> North Beach)
  (:action move-17
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?from ?t1) (travel17 ?from ?to) (plus17 ?t1 ?t2))
    :effect (and (not (at ?from ?t1)) (at ?to ?t2))
  )

  ;; Move taking 18 minutes (North Beach -> Richmond District)
  (:action move-18
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?from ?t1) (travel18 ?from ?to) (plus18 ?t1 ?t2))
    :effect (and (not (at ?from ?t1)) (at ?to ?t2))
  )

  ;; Meet John for at least 75 minutes: start at a John-available start time,
  ;; at North Beach, and advance time by 75 minutes to end the meeting.
  (:action meet-john
    :parameters (?loc - location ?tstart - time ?tend - time)
    :precondition (and
                   (at ?loc ?tstart)
                   (is-north-beach ?loc)
                   (john-available-start ?tstart)
                   (plus75 ?tstart ?tend)
                   (not (met-john)) )
    :effect (and
             (not (at ?loc ?tstart))
             (at ?loc ?tend)
             (met-john)
             (meeting-start ?tstart)
             (meeting-end ?tend))
  )
)