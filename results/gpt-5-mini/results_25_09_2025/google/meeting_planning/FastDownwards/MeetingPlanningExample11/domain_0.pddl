(define (domain meetup)
  (:requirements :strips :typing :fluents :negative-preconditions :equality :numeric-fluents)
  (:types person location)

  (:predicates
    (at ?p - person ?l - location)
    (met ?a - person ?b - person)
  )

  (:functions
    (time)                ; global time in minutes since midnight
    (carol-start)         ; Carol availability start (minutes since midnight)
    (carol-end)           ; Carol availability end (minutes since midnight)
    (travel-nh-sd)        ; travel time Nob Hill -> Sunset (minutes)
    (travel-sd-nh)        ; travel time Sunset -> Nob Hill (minutes)
  )

  ;; Visitor travels from Nob Hill to Sunset (distinct visitor action)
  (:action visitor-travel-nh-to-sd
    :parameters ()
    :precondition (and
      (at visitor nob_hill)
    )
    :effect (and
      (not (at visitor nob_hill))
      (at visitor sunset)
      (assign (time) (+ (time) (travel-nh-sd)))
    )
  )

  ;; Visitor travels from Sunset to Nob Hill (distinct visitor action)
  (:action visitor-travel-sd-to-nh
    :parameters ()
    :precondition (and
      (at visitor sunset)
    )
    :effect (and
      (not (at visitor sunset))
      (at visitor nob_hill)
      (assign (time) (+ (time) (travel-sd-nh)))
    )
  )

  ;; Visitor waits at Nob Hill until Carol's availability start (14:00) if earlier
  (:action visitor-wait-until-carol-start-at-nob
    :parameters ()
    :precondition (and
      (at visitor nob_hill)
      (<= (time) (carol-start))
    )
    :effect (and
      (assign (time) (carol-start))
    )
  )

  ;; Visitor waits at Sunset until Carol's availability start (14:00) if earlier
  (:action visitor-wait-until-carol-start-at-sd
    :parameters ()
    :precondition (and
      (at visitor sunset)
      (<= (time) (carol-start))
    )
    :effect (and
      (assign (time) (carol-start))
    )
  )

  ;; Meeting action initiated by the visitor that represents meeting Carol
  ;; Meeting must start while Carol is available and must fit the minimum 75-minute duration.
  ;; We ensure meeting start time <= (carol-end - 75) so the meeting finishes by carol-end.
  (:action visitor-meet-carol
    :parameters ()
    :precondition (and
      (at visitor sunset)
      (>= (time) (carol-start))
      (<= (time) (- (carol-end) 75))  ; start must allow full 75 minutes before Carol's end
      (not (met visitor carol))
    )
    :effect (and
      (assign (time) (+ (time) 75))   ; meeting lasts 75 minutes
      (met visitor carol)
    )
  )

)