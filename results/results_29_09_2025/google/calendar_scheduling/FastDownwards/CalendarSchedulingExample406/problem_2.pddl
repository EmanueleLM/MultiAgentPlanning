(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
    Alan Michael Michelle Roy Judy Natalie Brian - person
  )
  (:init
    (required Alan) (required Michael) (required Michelle) (required Roy) (required Judy) (required Natalie) (required Brian)

    (free Alan s1) (free Alan s3) (free Alan s7) (free Alan s8) (free Alan s9) (free Alan s11) (free Alan s12) (free Alan s13) (free Alan s14) (free Alan s15)
    (free Michael s0) (free Michael s1) (free Michael s2) (free Michael s3) (free Michael s4) (free Michael s5) (free Michael s6) (free Michael s7)
    (free Michael s8) (free Michael s9) (free Michael s10) (free Michael s11) (free Michael s12) (free Michael s13) (free Michael s14) (free Michael s15)
    (free Michelle s0) (free Michelle s1) (free Michelle s2) (free Michelle s3) (free Michelle s4) (free Michelle s5) (free Michelle s6) (free Michelle s7)
    (free Michelle s8) (free Michelle s9) (free Michelle s10) (free Michelle s11) (free Michelle s12) (free Michelle s13) (free Michelle s14) (free Michelle s15)
    (free Roy s0) (free Roy s2) (free Roy s3) (free Roy s4) (free Roy s5) (free Roy s6) (free Roy s8) (free Roy s11) (free Roy s12) (free Roy s13) (free Roy s14) (free Roy s15)
    (free Judy s3) (free Judy s13)
    (free Natalie s1) (free Natalie s2) (free Natalie s3) (free Natalie s7)
    (free Brian s0) (free Brian s3) (free Brian s6) (free Brian s7) (free Brian s8) (free Brian s10) (free Brian s12) (free Brian s14)

    (index0 s0) (index1 s1) (index2 s2) (index3 s3) (index4 s4) (index5 s5) (index6 s6) (index7 s7)
    (index8 s8) (index9 s9) (index10 s10) (index11 s11) (index12 s12) (index13 s13) (index14 s14) (index15 s15)

    (= (total-cost) 0)
  )
  (:goal (exists (?s - slot) (scheduled ?s)))
  (:metric minimize (total-cost))
)