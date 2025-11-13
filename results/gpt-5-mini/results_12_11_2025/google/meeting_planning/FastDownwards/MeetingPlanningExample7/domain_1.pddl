(define (domain meet-john)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    (at ?loc - location ?t - time)                 ; traveler at location at given timepoint
    (travel17 ?from - location ?to - location)     ; directed 17-minute travel edge
    (travel18 ?from - location ?to - location)     ; directed 18-minute travel edge
    (plus ?t1 - time ?t2 - time)                   ; generic allowed time jump (used for waits)
    (plus17 ?t1 - time ?t2 - time)                 ; t2 = t1 + 17
    (plus18 ?t1 - time ?t2 - time)                 ; t2 = t1 + 18
    (plus75 ?t1 - time ?t2 - time)                 ; t2 = t1 + 75
    (john-available-start ?t - time)               ; allowed meeting-start times for John (75-min meeting fits)
    (is-north-beach ?loc - location)               ; location is North Beach
    (met-john)                                      ; meeting with John completed
    (meeting-start ?t - time)                      ; record meeting start time
    (meeting-end ?t - time)                        ; record meeting end time
  )

  ;; Wait action: remain at same location while advancing time using a declared plus jump.
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

  ;; Meet John for at least 75 minutes: must be at North Beach at a permitted start time,
  ;; and advance time by 75 minutes; only possible once (met-john prevents repetition).
  (:action meet-john
    :parameters (?loc - location ?tstart - time ?tend - time)
    :precondition (and
                   (at ?loc ?tstart)
                   (is-north-beach ?loc)
                   (john-available-start ?tstart)
                   (plus75 ?tstart ?tend)
                   (not (met-john))
                 )
    :effect (and
             (not (at ?loc ?tstart))
             (at ?loc ?tend)
             (met-john)
             (meeting-start ?tstart)
             (meeting-end ?tend)
            )
  )
)