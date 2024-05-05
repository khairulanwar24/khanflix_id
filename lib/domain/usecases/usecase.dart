abstract interface class UseCase<R, P> {
  //R = Retur, P = Paramter
  Future<R> call(P params); //tipe kembalian dari call yaitu Future of R
}
