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
