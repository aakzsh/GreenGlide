enum ObstacleType {
  car,
  bike,
  bicycle,
  metro,
  train,
  airplane,
  skateboard,
  walking,
  taxi
}

Map<ObstacleType, double> obstacleSpeeds = {
  ObstacleType.car: 1500,
  ObstacleType.walking: 700,
  ObstacleType.bicycle: 1000,
  ObstacleType.bike: 1500,
  ObstacleType.metro: 1800,
  ObstacleType.train: 2400,
  ObstacleType.airplane: 5000,
  ObstacleType.skateboard: 1050,
  ObstacleType.taxi: 1300
};

Map<ObstacleType, double> carbonEmissions = {
  ObstacleType.car: 500,
  ObstacleType.walking: 0,
  ObstacleType.bicycle: 0,
  ObstacleType.bike: 300,
  ObstacleType.metro: 50,
  ObstacleType.train: 50,
  ObstacleType.airplane: 1000,
  ObstacleType.skateboard: 0,
  ObstacleType.taxi: 500
};


Map<ObstacleType, double> vehicleScores = {
  ObstacleType.car: -50,
  ObstacleType.walking: 100,
  ObstacleType.bicycle: 100,
  ObstacleType.bike: 20,
  ObstacleType.metro: 100,
  ObstacleType.train: 100,
  ObstacleType.airplane: -100,
  ObstacleType.skateboard: 100,
  ObstacleType.taxi: -50
};
