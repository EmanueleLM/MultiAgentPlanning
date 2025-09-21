(define (problem combined-schedule-monday)
  (:domain combined-schedule)

  (:objects
    slot-09-00 slot-09-30 slot-10-00 slot-10-30
    slot-11-00 slot-11-30 slot-12-00 slot-12-30
    slot-13-00 slot-13-30 slot-14-00 slot-14-30
    slot-15-00 slot-15-30 slot-16-00 slot-16-30 - slot

    brian billy patricia - person
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

    (available-brian slot-09-00)
    (available-brian slot-09-30)
    (available-brian slot-10-00)
    (available-brian slot-10-30)
    (available-brian slot-11-00)
    (available-brian slot-11-30)
    (available-brian slot-12-00)
    (available-brian slot-12-30)
    (available-brian slot-13-00)
    (available-brian slot-13-30)
    (available-brian slot-14-00)
    (available-brian slot-14-30)
    (available-brian slot-15-00)
    (available-brian slot-15-30)
    (available-brian slot-16-00)
    (available-brian slot-16-30)

    (busy-billy slot-10-00)
    (busy-billy slot-11-30)
    (busy-billy slot-14-00)
    (busy-billy slot-16-30)

    (busy-patricia slot-09-00)
    (busy-patricia slot-09-30)
    (busy-patricia slot-10-00)
    (busy-patricia slot-10-30)
    (busy-patricia slot-11-00)
    (busy-patricia slot-11-30)
    (busy-patricia slot-12-00)
    (busy-patricia slot-13-30)
    (busy-patricia slot-14-30)
    (busy-patricia slot-15-00)
    (busy-patricia slot-15-30)
    (busy-patricia slot-16-30)

    (late slot-16-00)
    (late slot-16-30)
  )

  (:goal (meeting-booked))
)