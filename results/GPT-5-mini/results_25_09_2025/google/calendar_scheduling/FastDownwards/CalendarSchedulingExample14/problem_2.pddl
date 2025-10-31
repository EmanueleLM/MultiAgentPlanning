(define (problem schedule-30min-monday)
  (:domain multiagent-meeting)
  (:objects
    brandon jerry bradley - person
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )
  (:init
    (= (total-cost) 0)
    (before-1430 s0) (before-1430 s1) (before-1430 s2) (before-1430 s3)
    (before-1430 s4) (before-1430 s5) (before-1430 s6) (before-1430 s7)
    (before-1430 s8) (before-1430 s9) (before-1430 s10)
    (free brandon s0) (free brandon s1) (free brandon s2) (free brandon s3)
    (free brandon s4) (free brandon s5) (free brandon s6) (free brandon s7)
    (free brandon s10) (free brandon s11) (free brandon s12) (free brandon s14)
    (free jerry s0) (free jerry s1) (free jerry s2) (free jerry s3)
    (free jerry s4) (free jerry s5) (free jerry s6) (free jerry s7)
    (free jerry s8) (free jerry s9) (free jerry s10) (free jerry s11)
    (free jerry s12) (free jerry s13) (free jerry s14) (free jerry s15)
    (free bradley s12) (free bradley s13) (free bradley s15)
  )
  (:goal (meeting-scheduled))
  (:metric minimize (total-cost))
)