(define (problem marina-integrated)
  (:domain integrated-meeting)
  (:objects
    jessica visitor - person
  )

  (:init
     (at jessica Presidio)
     (at visitor MarinaDistrict)
     (= (time) 0)
  )

  (:goal (met-jessica))
)