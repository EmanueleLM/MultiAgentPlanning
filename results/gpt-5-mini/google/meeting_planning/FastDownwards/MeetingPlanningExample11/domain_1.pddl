(define (domain meeting_planning_example11)
  (:requirements :strips :typing)
  (:types location timepoint)
  (:predicates
    ;; traveler location at a named timepoint
    (at ?loc - location ?t - timepoint)
    ;; Carol is present at a named timepoint
    (carol_present ?t - timepoint)
    ;; goal fluent: traveler has met Carol for the required continuous window
    (met_carol)
  )

  ;; Travel action that represents the concrete 25-minute trip
  ;; from Nob Hill departing at 13:35 and arriving at 14:00.
  ;; Precondition: traveler is at Nob Hill at the departure timepoint.
  ;; Effect: traveler is at Sunset at the arrival timepoint.
  (:action travel_1335_to_1400
    :parameters ()
    :precondition (at nobhill t1335)
    :effect (and
              (not (at nobhill t1400))
              (at sunset t1400)
            )
  )

  ;; Meeting action that represents a continuous 75-minute meeting
  ;; starting at 14:00 and ending at 15:15.
  ;; Precondition: traveler is at Sunset at 14:00 and Carol is present
  ;; for the meeting interval endpoints used in this model.
  ;; Effect: record that the required meeting with Carol has occurred.
  (:action meet_carol_1400_1515
    :parameters ()
    :precondition (and
                    (at sunset t1400)
                    (carol_present t1400)
                    (carol_present t1515)
                  )
    :effect (and
              (met_carol)
            )
  )
)