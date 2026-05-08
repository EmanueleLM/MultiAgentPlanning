(define (problem schedule_monday_meeting)
  (:domain schedule_meeting)

  (:objects
    ;; half-hour slots for Monday work hours 09:00-17:00
    s0900_0930 s0930_1000 s1000_1030 s1030_1100
    s1100_1130 s1130_1200 s1200_1230 s1230_1300
    s1300_1330 s1330_1400 s1400_1430 s1430_1500
    s1500_1530 s1530_1600 s1600_1630 s1630_1700 - slot
  )

  (:init
    ;; successor / contiguity relations (explicit, ordered)
    (successor s0900_0930 s0930_1000)
    (successor s0930_1000 s1000_1030)
    (successor s1000_1030 s1030_1100)
    (successor s1030_1100 s1100_1130)
    (successor s1100_1130 s1130_1200)
    (successor s1130_1200 s1200_1230)
    (successor s1200_1230 s1230_1300)
    (successor s1230_1300 s1300_1330)
    (successor s1300_1330 s1330_1400)
    (successor s1330_1400 s1400_1430)
    (successor s1400_1430 s1430_1500)
    (successor s1430_1500 s1500_1530)
    (successor s1500_1530 s1530_1600)
    (successor s1530_1600 s1600_1630)
    (successor s1600_1630 s1630_1700)

    ;; Audited availability facts (distinct predicates per participant)
    ;; Participant mapping: Participant 1 = Madison, Participant 2 = Diana, Participant 3 = Shirley

    ;; Madison availability (Participant 1)
    (available-madison s0900_0930)
    (available-madison s1000_1030)
    (available-madison s1030_1100)
    (available-madison s1100_1130)
    (available-madison s1200_1230)
    (available-madison s1230_1300)
    (available-madison s1300_1330)
    (available-madison s1330_1400)
    (available-madison s1400_1430)
    (available-madison s1430_1500)
    (available-madison s1500_1530)
    (available-madison s1530_1600)
    (available-madison s1600_1630)
    (available-madison s1630_1700)

    ;; Diana availability (Participant 2)
    (available-diana s0900_0930)
    (available-diana s0930_1000)
    (available-diana s1000_1030)
    (available-diana s1030_1100)
    (available-diana s1130_1200)
    (available-diana s1200_1230)
    (available-diana s1230_1300)
    (available-diana s1300_1330)
    (available-diana s1330_1400)
    (available-diana s1400_1430)
    (available-diana s1430_1500)
    (available-diana s1500_1530)
    (available-diana s1530_1600)
    (available-diana s1600_1630)
    (available-diana s1630_1700)

    ;; Shirley availability (Participant 3)
    (available-shirley s1200_1230)
    (available-shirley s1230_1300)
    (available-shirley s1300_1330)
    (available-shirley s1500_1530)
  )

  ;; Goal: a meeting must be established (planner will select the contiguous pair
  ;; that satisfies all hard constraints). All participant confirmations and finalization
  ;; are enforced by domain preconditions, so achieving this atomic goal implies constraints met.
  (:goal (and
    (meeting-established)
  ))
)