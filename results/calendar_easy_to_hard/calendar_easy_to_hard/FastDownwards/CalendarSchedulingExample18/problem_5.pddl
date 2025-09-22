(define (problem combined-schedule-monday)
  (:domain combined-schedule)

  (:objects
    slot-09-00 slot-09-30 slot-10-00 slot-10-30
    slot-11-00 slot-11-30 slot-12-00 slot-12-30
    slot-13-00 slot-13-30 slot-14-00 slot-14-30
    slot-15-00 slot-15-30 slot-16-00 slot-16-30 - slot

    lisa dorothy anthony ryan - person
  )

  (:init
    (slot slot-09-00)   (within-work-hours slot-09-00)
    (slot slot-09-30)   (within-work-hours slot-09-30)
    (slot slot-10-00)   (within-work-hours slot-10-00)
    (slot slot-10-30)   (within-work-hours slot-10-30)
    (slot slot-11-00)   (within-work-hours slot-11-00)
    (slot slot-11-30)   (within-work-hours slot-11-30)
    (slot slot-12-00)   (within-work-hours slot-12-00)
    (slot slot-12-30)   (within-work-hours slot-12-30)
    (slot slot-13-00)   (within-work-hours slot-13-00)
    (slot slot-13-30)   (within-work-hours slot-13-30)
    (slot slot-14-00)   (within-work-hours slot-14-00)
    (slot slot-14-30)   (within-work-hours slot-14-30)
    (slot slot-15-00)   (within-work-hours slot-15-00)
    (slot slot-15-30)   (within-work-hours slot-15-30)
    (slot slot-16-00)   (within-work-hours slot-16-00)
    (slot slot-16-30)   (within-work-hours slot-16-30)

    (slot-free slot-09-00) (slot-free slot-09-30) (slot-free slot-10-00) (slot-free slot-10-30)
    (slot-free slot-11-00) (slot-free slot-11-30) (slot-free slot-12-00) (slot-free slot-12-30)
    (slot-free slot-13-00) (slot-free slot-13-30) (slot-free slot-14-00) (slot-free slot-14-30)
    (slot-free slot-15-00) (slot-free slot-15-30) (slot-free slot-16-00) (slot-free slot-16-30)

    ;; Lisa: blocked times and cannot meet before 14:30 (mark all slots starting before 14:30 busy)
    (busy lisa slot-09-00)
    (busy lisa slot-09-30)
    (busy lisa slot-10-00)
    (busy lisa slot-10-30)
    (busy lisa slot-11-00)
    (busy lisa slot-11-30)
    (busy lisa slot-12-00)
    (busy lisa slot-12-30)
    (busy lisa slot-13-00)
    (busy lisa slot-13-30)
    (busy lisa slot-14-00)
    ;; Lisa also busy 15:00-16:00
    (busy lisa slot-15-00)
    (busy lisa slot-15-30)

    ;; Dorothy busy times
    (busy dorothy slot-09-00)
    (busy dorothy slot-10-30)
    (busy dorothy slot-11-00)
    (busy dorothy slot-13-30)
    (busy dorothy slot-14-30)
    (busy dorothy slot-15-00)

    ;; Anthony busy times
    (busy anthony slot-09-00)
    (busy anthony slot-09-30)
    (busy anthony slot-11-00)
    (busy anthony slot-11-30)
    (busy anthony slot-12-00)
    (busy anthony slot-13-00)
    (busy anthony slot-13-30)
    (busy anthony slot-15-00)
    (busy anthony slot-15-30)
    (busy anthony slot-16-00)

    ;; Ryan busy times
    (busy ryan slot-09-00)
    (busy ryan slot-09-30)
    (busy ryan slot-10-00)
    (busy ryan slot-10-30)
    (busy ryan slot-11-00)
    (busy ryan slot-11-30)
    (busy ryan slot-12-00)
    (busy ryan slot-13-00)
    (busy ryan slot-13-30)
    (busy ryan slot-14-00)
    (busy ryan slot-14-30)
    (busy ryan slot-15-00)
    (busy ryan slot-15-30)
    (busy ryan slot-16-00)
  )

  (:goal (meeting-booked))
)