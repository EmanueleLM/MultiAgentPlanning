(define (domain multi-agent-meeting)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types Person Slot)

  ; Constants for agents and time-slots
  (:constants michelle steven jerry - Person
              s0900_1000 s1000_1100 s1100_1200 s1200_1300
              s1300_1400 s1400_1500 s1500_1600 s1600_1700 - Slot)

  ; Predicates
  (:predicates
    (available ?p - Person ?s - Slot)
    (signs-michelle ?s - Slot)
    (signs-steven ?s - Slot)
    (signs-jerry ?s - Slot)
    (scheduled ?s - Slot)
  )

  ; Agent-specific signing actions (distinct by agent)
  (:action sign-michelle-slot
     :parameters (?slot - Slot)
     :precondition (available michelle ?slot)
     :effect (signs-michelle ?slot)
     :cost 0)

  (:action sign-steven-slot
     :parameters (?slot - Slot)
     :precondition (available steven ?slot)
     :effect (signs-steven ?slot)
     :cost 0)

  (:action sign-jerry-slot
     :parameters (?slot - Slot)
     :precondition (available jerry ?slot)
     :effect (signs-jerry ?slot)
     :cost 0)

  ; Schedule actions for each 60-minute slot (one per possible slot)
  ; These require that all three signs exist for that slot and all participants are available
  (:action schedule-0900
     :precondition (and (not (scheduled s0900_1000))
                        (signs-michelle s0900_1000)
                        (signs-steven s0900_1000)
                        (signs-jerry s0900_1000)
                        (available michelle s0900_1000)
                        (available steven s0900_1000)
                        (available jerry s0900_1000))
     :effect (and (scheduled s0900_1000)
                  (not (available michelle s0900_1000))
                  (not (available steven s0900_1000))
                  (not (available jerry s0900_1000)))
     :cost 0)

  (:action schedule-1000
     :precondition (and (not (scheduled s1000_1100))
                        (signs-michelle s1000_1100)
                        (signs-steven s1000_1100)
                        (signs-jerry s1000_1100)
                        (available michelle s1000_1100)
                        (available steven s1000_1100)
                        (available jerry s1000_1100))
     :effect (and (scheduled s1000_1100)
                  (not (available michelle s1000_1100))
                  (not (available steven s1000_1100))
                  (not (available jerry s1000_1100)))
     :cost 60)

  (:action schedule-1100
     :precondition (and (not (scheduled s1100_1200))
                        (signs-michelle s1100_1200)
                        (signs-steven s1100_1200)
                        (signs-jerry s1100_1200)
                        (available michelle s1100_1200)
                        (available steven s1100_1200)
                        (available jerry s1100_1200))
     :effect (and (scheduled s1100_1200)
                  (not (available michelle s1100_1200))
                  (not (available steven s1100_1200))
                  (not (available jerry s1100_1200)))
     :cost 120)

  (:action schedule-1200
     :precondition (and (not (scheduled s1200_1300))
                        (signs-michelle s1200_1300)
                        (signs-steven s1200_1300)
                        (signs-jerry s1200_1300)
                        (available michelle s1200_1300)
                        (available steven s1200_1300)
                        (available jerry s1200_1300))
     :effect (and (scheduled s1200_1300)
                  (not (available michelle s1200_1300))
                  (not (available steven s1200_1300))
                  (not (available jerry s1200_1300)))
     :cost 180)

  (:action schedule-1300
     :precondition (and (not (scheduled s1300_1400))
                        (signs-michelle s1300_1400)
                        (signs-steven s1300_1400)
                        (signs-jerry s1300_1400)
                        (available michelle s1300_1400)
                        (available steven s1300_1400)
                        (available jerry s1300_1400))
     :effect (and (scheduled s1300_1400)
                  (not (available michelle s1300_1400))
                  (not (available steven s1300_1400))
                  (not (available jerry s1300_1400)))
     :cost 240)

  (:action schedule-1400
     :precondition (and (not (scheduled s1400_1500))
                        (signs-michelle s1400_1500)
                        (signs-steven s1400_1500)
                        (signs-jerry s1400_1500)
                        (available michelle s1400_1500)
                        (available steven s1400_1500)
                        (available jerry s1400_1500))
     :effect (and (scheduled s1400_1500)
                  (not (available michelle s1400_1500))
                  (not (available steven s1400_1500))
                  (not (available jerry s1400_1500)))
     :cost 300)

  (:action schedule-1500
     :precondition (and (not (scheduled s1500_1600))
                        (signs-michelle s1500_1600)
                        (signs-steven s1500_1600)
                        (signs-jerry s1500_1600)
                        (available michelle s1500_1600)
                        (available steven s1500_1600)
                        (available jerry s1500_1600))
     :effect (and (scheduled s1500_1600)
                  (not (available michelle s1500_1600))
                  (not (available steven s1500_1600))
                  (not (available jerry s1500_1600)))
     :cost 360)

  (:action schedule-1600
     :precondition (and (not (scheduled s1600_1700))
                        (signs-michelle s1600_1700)
                        (signs-steven s1600_1700)
                        (signs-jerry s1600_1700)
                        (available michelle s1600_1700)
                        (available steven s1600_1700)
                        (available jerry s1600_1700))
     :effect (and (scheduled s1600_1700)
                  (not (available michelle s1600_1700))
                  (not (available steven s1600_1700))
                  (not (available jerry s1600_1700)))
     :cost 420)
)