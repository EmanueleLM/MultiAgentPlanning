(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    thomas dylan jerry - person
    s9_00 s9_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30 s13_00
    s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 - slot
  )
  (:init
    (next s9_00 s9_30) (next s9_30 s10_00) (next s10_00 s10_30)
    (next s10_30 s11_00) (next s11_00 s11_30) (next s11_30 s12_00)
    (next s12_00 s12_30) (next s12_30 s13_00) (next s13_00 s13_30)
    (next s13_30 s14_00) (next s14_00 s14_30) (next s14_30 s15_00)
    (next s15_00 s15_30) (next s15_30 s16_00)

    ;; Thomas is free entire work day
    (available thomas s9_00) (available thomas s9_30) (available thomas s10_00)
    (available thomas s10_30) (available thomas s11_00) (available thomas s11_30)
    (available thomas s12_00) (available thomas s12_30) (available thomas s13_00)
    (available thomas s13_30) (available thomas s14_00) (available thomas s14_30)
    (available thomas s15_00) (available thomas s15_30) (available thomas s16_00)

    ;; Dylan busy 10:30-11:00 and 13:30-14:00 -> those start slots unavailable (s10_30, s13_30)
    (available dylan s9_00) (available dylan s9_30) (available dylan s10_00)
    (available dylan s11_00) (available dylan s11_30) (available dylan s12_00)
    (available dylan s12_30) (available dylan s13_00) (available dylan s14_00)
    (available dylan s14_30) (available dylan s15_00) (available dylan s15_30)
    (available dylan s16_00)

    ;; Jerry busy 9:00-11:00, 11:30-14:30, 16:00-17:00 -> available at s11_00, and from s14_30 to s15_30
    (available jerry s11_00) (available jerry s14_30) (available jerry s15_00) (available jerry s15_30)
  )
  (:goal (meeting-scheduled))
)