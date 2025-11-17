(define (problem schedule-adam-jerry-matthew)
 (:domain meeting-scheduling)
 (:objects
  s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - timeslot
  adam jerry matthew - participant
 )
 (:init
  (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7)
  (next s7 s8) (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
  (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16)

  (busy adam s3) (busy adam s8) (busy adam s10) (busy adam s11)
  (busy jerry s1) (busy jerry s7) (busy jerry s13) (busy jerry s14)
  (busy matthew s2) (busy matthew s3) (busy matthew s4)
  (busy matthew s6) (busy matthew s7)
  (busy matthew s9) (busy matthew s10)
  (busy matthew s12) (busy matthew s13) (busy matthew s14) (busy matthew s15) (busy matthew s16)
 )
 (:goal (meeting-scheduled))
)