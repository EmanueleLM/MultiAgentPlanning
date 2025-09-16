(define (domain meeting-scheduler)
  (:requirements :typing)
  (:types person time meeting)
  (:predicates
     (free ?p - person ?t - time)
     (time_slot ?t - time)
     (start ?m - meeting ?t - time)
     (blocked ?p - person ?t - time)
  )
  (:constants benjamin hannah brenda - person
              t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200
              t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500
              t1500_1530 t1530_1600 t1600_1630 t1630_1700 - time
  )
  ; Agent 1: Benjamin/Hannah/Brenda perspective; schedules only if all three free
  (:action agent1_schedule_meeting
     :parameters (?m - meeting ?t - time)
     :precondition (and (time_slot ?t)
                        (free benjamin ?t)
                        (free hannah ?t)
                        (free brenda ?t)
                        (not (start ?m ?t)))
     :effect (and (start ?m ?t)
                  (not (free benjamin ?t))
                  (not (free hannah ?t))
                  (not (free brenda ?t)))
  )
  ; Agent 2: Hannah perspective; same basic constraint (all three free)
  (:action agent2_schedule_meeting
     :parameters (?m - meeting ?t - time)
     :precondition (and (time_slot ?t)
                        (free hannah ?t)
                        (free benjamin ?t)
                        (free brenda ?t)
                        (not (start ?m ?t)))
     :effect (and (start ?m ?t)
                  (not (free benjamin ?t))
                  (not (free hannah ?t))
                  (not (free brenda ?t)))
  )
  ; Agent 3: Brenda perspective; all must be unblocked on the slot
  (:action agent3_schedule_meeting
     :parameters (?m - meeting ?t - time)
     :precondition (and (time_slot ?t)
                        (not (blocked benjamin ?t))
                        (not (blocked hannah ?t))
                        (not (blocked brenda ?t))
                        (not (start ?m ?t)))
     :effect (and (start ?m ?t)
                  (blocked benjamin ?t)
                  (blocked hannah ?t)
                  (blocked brenda ?t))
  )
)